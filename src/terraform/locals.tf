locals {
  gce_labels = {
    project = "honeypot"
  }
  deployment = random_string.deployment-id.result

}

resource "random_string" "deployment-id" {
  length  = 6
  upper   = false
  special = false
}
