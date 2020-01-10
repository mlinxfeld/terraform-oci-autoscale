variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "private_key_oci" {}
variable "public_key_oci" {}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCNname" {
  default = "FoggyKitchenVCN"
}

variable "ADs" {
#  default = ["unja:EU-FRANKFURT-1-AD-1", "unja:EU-FRANKFURT-1-AD-2", "unja:EU-FRANKFURT-1-AD-3"]
default = ["mmXc:PHX-AD-1","mmXc:PHX-AD-2","mmXc:PHX-AD-3"]
}

variable "Shapes" {
 default = ["VM.Standard.E2.1","VM.Standard.E2.1.Micro","VM.Standard2.1","VM.Standard.E2.1","VM.Standard.E2.2"]
}

variable "Images" {
 # Oracle-Linux-7.7-2019.11.12-0 in Frankfurt
 # default = ["ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3bu75jht762mfvwroa2gdck6boqwyktztyu5dfhftcycucyp63ma"]
 # Oracle-Linux-7.7-2019.12.18-0 in Phoenix
 default = ["ocid1.image.oc1.phx.aaaaaaaactxf4lnfjj6itfnblee3g3uckamdyhqkwfid6wslesdxmlukqvpa"]
}

variable "webservice_ports" {
  default = [80,443]
}

variable "bastion_ports" {
  default = [22]
}

variable custom_bootstrap_file_name {
  default = "./bootstrap_webserver.sh"
}
