module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.cidr_vpc

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_igw         = true
  single_nat_gateway = true
  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = var.environment_tag
  }
}
resource "aws_subnet" "subnet_public" {
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Environment = var.environment_tag
  }
}
resource "aws_security_group" "jenkins-sg" {
  name        = "Allow web traffic"
  vpc_id      = module.vpc.vpc_id
  description = "inbound ports for ssh and standard http and everything outbound"
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name"        = "Jenkins-sg"
    "Terraform"   = "true"
    "Environment" = var.environment_tag

  }
}