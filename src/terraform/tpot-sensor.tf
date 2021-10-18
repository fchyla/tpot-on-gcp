resource "google_compute_instance" "teapot-sensor" {
  name         = "teapot-sensor-${local.deployment}"
  machine_type = "e2-medium"
  zone         = var.gce_zone

  labels = local.gce_labels

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 100
    }
  }
  metadata = {
    user-data      = data.template_file.teapot-startup-sensor.rendered
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
data "template_file" "teapot-startup-sensor" {
  template = file("templates/cloud-init.yaml")

  vars = {
    timezone     = var.timezone,
    password     = var.linux_password,
    tpot_flavor  = "SENSOR",
    web_user     = var.web_user,
    web_password = var.web_password
  }
}
