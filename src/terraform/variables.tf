variable "admin_ip" {
  default     = ["127.0.0.1/32"]
  description = "admin IP addresses in CIDR format"
}

variable "gce_instance_type" {
  default = "n2-highmem-2"
  description = "Instances size for deployment"
}

variable "gce_zone" {
  default = "europe-west4-b"
}

variable "project" {
  description = "GCP project to use"
}
# Refer to https://wiki.debian.org/Cloud/AmazonEC2Image/Buster
## cloud-init configuration ##
variable "timezone" {
  default = "UTC"
}

variable "linux_password" {
  #default = "LiNuXuSeRPaSs#"
  description = "Set a password for the default user"

  validation {
    condition     = length(var.linux_password) > 0
    error_message = "Please specify a password for the default user."
  }
}

## These will go in the generated teapot.conf file ##
variable "teapot_flavor" {
  default     = "STANDARD"
  description = "Specify your teapot flavor [STANDARD, SENSOR, INDUSTRIAL, COLLECTOR, NEXTGEN, MEDICAL]"
}

variable "web_user" {
  default     = "webuser"
  description = "Set a username for the web user"
}

variable "web_password" {
  #default = "w3b$ecret"
  description = "Set a password for the web user"

  validation {
    condition     = length(var.web_password) > 0
    error_message = "Please specify a password for the web user."
  }
}

variable "ssh_key_file" {
  description = "Path for public SSH key file"
}
