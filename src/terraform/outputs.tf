output "Admin_UI_collector" {
  value = "https://${google_compute_instance.teapot-collector.network_interface.0.access_config.0.nat_ip}:64294/"
}

output "Admin_UI_sensor" {
  value = "https://${google_compute_instance.teapot-sensor.network_interface.0.access_config.0.nat_ip}:64294/"
}
output "SSH_Access_collector" {
  value = "gcloud compute ssh --ssh-flag='-p 64295' ${google_compute_instance.teapot-collector.name} --zone ${google_compute_instance.teapot-collector.zone} "
}

output "SSH_Access_sensor" {
  value = "gcloud compute ssh --ssh-flag='-p 64295' ${google_compute_instance.teapot-sensor.name} --zone ${google_compute_instance.teapot-sensor.zone}"
}

output "Web_UI_collector" {
  value = "https://${google_compute_instance.teapot-collector.network_interface.0.access_config.0.nat_ip}:64297/"
}


output "Web_UI_sensor" {
  value = "https://${google_compute_instance.teapot-sensor.network_interface.0.access_config.0.nat_ip}:64297/"
}
