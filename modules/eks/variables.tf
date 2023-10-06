variable "cluster_name_dc" {
  description = "The name of the EKS Cluster"
  type        = string
}

variable "subnet_id_dc_a" {
  description = "The ID of the subnet where the EKS Cluster will be created"
  type        = string
}

variable "availability_zone_b" {
  description = ""
  type        = string
}

variable "vpc_main_dc" {
  description = ""
  type        = string
}