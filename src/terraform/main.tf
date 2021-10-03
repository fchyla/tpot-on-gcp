#################################################################################
# Network
resource "google_compute_network" "teapot_vpc_network" {
  name                    = "teapot-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "teapot_subnetwork" {
  name          = "teapot-subnetwork"
  ip_cidr_range = "10.2.0.0/24"
  region        = "europe-west4"
  network       = google_compute_network.teapot_vpc_network.id

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
#################################################################################
# Instance
resource "google_compute_instance" "teapot" {
  name         = "teapot"
  machine_type = var.gce_instance_type
  zone         = var.gce_zone

  labels = local.gce_labels

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 128
    }
  }
  metadata = {
    user-data      = data.template_file.teapot-startup.rendered
    ssh-keys       = var.ssh_key_file
    startup-script = file("templates/startup.sh")
  }

  network_interface {
    subnetwork = google_compute_subnetwork.teapot_subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }
  service_account {
    email  = google_service_account.teapot_service_account.email
    scopes = ["cloud-platform"]
  }
}
data "template_file" "teapot-startup" {
  template = file("templates/cloud-init.yaml")

  vars = {
    timezone     = var.timezone,
    password     = var.linux_password,
    tpot_flavor  = var.teapot_flavor,
    web_user     = var.web_user,
    web_password = var.web_password
  }
}
#################################################################################
# Service account
resource "google_service_account" "teapot_service_account" {
  account_id   = "teapot-runner"
  display_name = "Time to make some tea"
}

resource "google_project_iam_binding" "teapot_service_account_logs" {
  project = var.project
  role    = "roles/logging.logWriter"

  members = [
    "serviceAccount:${google_service_account.teapot_service_account.email}",
  ]
}


resource "google_project_iam_binding" "teapot_service_account_metrics" {
  project = var.project
  role    = "roles/monitoring.metricWriter"

  members = [
    "serviceAccount:${google_service_account.teapot_service_account.email}",
  ]
}

#################################################################################
# Firewall
resource "google_compute_firewall" "teapot-admin" {
  name        = "teapot-access"
  network     = google_compute_network.teapot_vpc_network.id
  description = "To watch the kettle boil"

  allow {
    protocol = "tcp"
    ports    = ["64294", "64295", "64297"]
  }
  source_ranges           = [var.admin_ip]
  target_service_accounts = [google_service_account.teapot_service_account.email]
}

resource "google_compute_firewall" "teapot-public-tcp" {
  name        = "teapot-access-tcp"
  network     = google_compute_network.teapot_vpc_network.id
  description = "To watch the kettle boil"

  allow {
    protocol = "tcp"
    ports    = ["0-64000"]
  }
  source_ranges           = ["0.0.0.0/0"]
  target_service_accounts = [google_service_account.teapot_service_account.email]
}

resource "google_compute_firewall" "teapot-public-udp" {
  name        = "teapot-access-udp"
  network     = google_compute_network.teapot_vpc_network.id
  description = "To watch the kettle boil"

  allow {
    protocol = "udp"
    ports    = ["0-64000"]
  }
  source_ranges           = ["0.0.0.0/0"]
  target_service_accounts = [google_service_account.teapot_service_account.email]
}
