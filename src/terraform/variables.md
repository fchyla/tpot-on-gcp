## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.86.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.86.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.teapot-admin](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.teapot-public-tcp](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.teapot-public-udp](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_firewall) | resource |
| [google_compute_instance.teapot](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_instance) | resource |
| [google_compute_network.teapot_vpc_network](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.teapot_subnetwork](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_subnetwork) | resource |
| [google_project_iam_binding.project](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/project_iam_binding) | resource |
| [google_service_account.teapot_service_account](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/service_account) | resource |
| [template_file.teapot-startup](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ip"></a> [admin\_ip](#input\_admin\_ip) | admin IP addresses in CIDR format | `list` | <pre>[<br>  "127.0.0.1/32"<br>]</pre> | no |
| <a name="input_gce_instance_type"></a> [gce\_instance\_type](#input\_gce\_instance\_type) | Instances size for deployment | `string` | `"n2-highmem-2"` | no |
| <a name="input_gce_zone"></a> [gce\_zone](#input\_gce\_zone) | n/a | `string` | `"europe-west4-b"` | no |
| <a name="input_linux_password"></a> [linux\_password](#input\_linux\_password) | Set a password for the default user | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP project to use | `any` | n/a | yes |
| <a name="input_ssh_key_file"></a> [ssh\_key\_file](#input\_ssh\_key\_file) | Path for public SSH key file | `any` | n/a | yes |
| <a name="input_teapot_flavor"></a> [teapot\_flavor](#input\_teapot\_flavor) | Specify your teapot flavor [STANDARD, SENSOR, INDUSTRIAL, COLLECTOR, NEXTGEN, MEDICAL] | `string` | `"STANDARD"` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Refer to https://wiki.debian.org/Cloud/AmazonEC2Image/Buster # cloud-init configuration ## | `string` | `"UTC"` | no |
| <a name="input_web_password"></a> [web\_password](#input\_web\_password) | Set a password for the web user | `any` | n/a | yes |
| <a name="input_web_user"></a> [web\_user](#input\_web\_user) | Set a username for the web user | `string` | `"webuser"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Admin_UI"></a> [Admin\_UI](#output\_Admin\_UI) | n/a |
| <a name="output_SSH_Access"></a> [SSH\_Access](#output\_SSH\_Access) | n/a |
| <a name="output_Web_UI"></a> [Web\_UI](#output\_Web\_UI) | n/a |
