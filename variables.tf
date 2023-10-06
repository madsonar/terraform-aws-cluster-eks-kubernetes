variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}
//Se você estiver usando o GitHub Actions para CI/CD, você pode definir TF_VAR_aws_region como uma variável de ambiente no seu workflow.

variable "availability_zone_a" {
  description = "The AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The AWS availability zone"
  type        = string
  default     = "us-east-1b"
}

variable "cluster_name_dc" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "eks-cluster-dc"
}
