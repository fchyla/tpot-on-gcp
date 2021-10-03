terraform {
  required_version = ">= 0.15.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.86.0"
    }
  }
}
