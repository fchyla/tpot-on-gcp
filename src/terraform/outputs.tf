output "Admin_UI" {
  value = "https://${google_compute_instance.teapot.network_interface.0.access_config.0.nat_ip}:64294/"
}

output "SSH_Access" {
  value = "ssh -i <YOUR_SSH_KEY> -p 64295 ${google_compute_instance.teapot.network_interface.0.access_config.0.nat_ip}"
}

output "Web_UI" {
  value = "https://${google_compute_instance.teapot.network_interface.0.access_config.0.nat_ip}:64297/"
}

