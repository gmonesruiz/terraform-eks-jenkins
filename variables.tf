# Variables
# Region
variable "aws_region" {
  default = "us-east-1"
}

# Profile, used to authenticate to AWS.
# This is the profile name in ~/.aws/credentials
#variable "aws_profile" {
  #default = "gabriel"
#}

# Instance
variable "instance_name" {
  description = "Name of the instance to be created"
  default     = "terraform-demo1"
}

variable "instance_type" {
  default = "t3.medium"
}

#variable "subnet_id" {
 # description = "The VPC subnet the instance(s) will be created in"
  #default     = "subnet-07ebbe60"
#}

variable "ami_id" {
  description = "The AMI to use"
  default     = "ami-007855ac798b5175e" # Ubuntu 22.04 LTS // eu-west-3
}

variable "number_of_instances" {
  description = "number of instances to be created"
  default     = 1
}

# VPC and subnet.

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}
variable "private_subnets" {
  description = "CIDR block for the subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets" {
  description = "CIDR block for the subnet"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
variable "azs" {
  description = "availability zone to create subnet"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "public_key_path" {
  description = "Public key path"
  default     = "~/.ssh/id_rsa.pub"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}

# Security group
variable "ingressports" {
  type    = list(number)
  default = [8080, 22]
}