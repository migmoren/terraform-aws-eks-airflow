variable "profile" {
  default     = "default"
  description = "AWS profile"
}

variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  description = "The name of the Airflow cluster (e.g. airflow-xyz). This variable is used to namespace all resources created by this module."
  type        = string
}

variable "tags" {
  description = "Additional tags used into terraform-labels module."
  type        = map(string)
  default     = {}
}

variable "public_tags" {
  description = "Additional tags used into terraform-labels module for public subnets."
  type        = map(string)
  default     = {}
}

variable "private_tags" {
  description = "Additional tags used into terraform-labels module for private subnets."
  type        = map(string)
  default     = {}
}

variable "prefix_name" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cidr" {
  default     = "10.0.0.0/16"
  description = "cidr for the AWS EKS"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Private Subnets IP addresses"
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "Public Subnets IP addresses"
}

variable "instance_type_group1" {
  default     = "t2.medium"
  description = "Instance type for the group 1"
}

variable "instance_type_group2" {
  default     = "t2.medium"
  description = "Instance type for the group 2"
}

variable "asg_desired_capacity_group1" {
  default     = 2
  description = "Desired capacity for autoscaling for the group 1"
}

variable "asg_desired_capacity_group2" {
  default     = 2
  description = "Desired capacity for autoscaling for the group 2"
}

variable "cluster_version" {
  default     = "1.15"
  description = "Cluster version"
}
