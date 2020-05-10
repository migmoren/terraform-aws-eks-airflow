provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.11"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name = "${var.prefix_name}-vpc-eks"
  cidr = var.cidr
  azs  = data.aws_availability_zones.available.names
  #private_subnets      = [var.private_subnets]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  #public_subnets       = [var.public_subnets]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = merge(map("Name", "${var.prefix_name}-vpc-eks"), var.tags)

  private_subnet_tags = merge(map("Name", "${var.prefix_name}-private-subnet-eks"), var.tags)
  public_subnet_tags  = merge(map("Name", "${var.prefix_name}-public-subnet-eks"), var.tags)

}
