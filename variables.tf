variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCNname" {
  default = "FoggyKitchenVCN"
}

variable "instance_os" {
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  default     = "8"
}

variable "shape" {
 default = "VM.Standard.E4.Flex"
}

variable "flex_shape_memory" {
  default = 8
}

variable "flex_shape_ocpus" {
  default = 1
}

variable "webservice_ports" {
  default = [80,443]
}

variable "bastion_ports" {
  default = [22]
}

variable "enable_instance_configuration" {
  default = false
}

variable "enable_instance_pool" {
  default = false
}

variable "enable_scheduled_autoscaling" {
  default = false
}

variable "enable_threshold_autoscaling" {
  default = false
}