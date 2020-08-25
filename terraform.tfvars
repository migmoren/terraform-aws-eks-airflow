cluster_name = "airflow-eks"
region       = "us-east-2"
profile      = "default"

tags = {
  Project = "Airflow"
  Team    = "Wizeline"
}

public_tags = {
  Project                  = "Airflow"
  Team                     = "Wizeline"
  "kubernetes.io/role/elb" = "1"
}

private_tags = {
  Project                           = "Airflow"
  Team                              = "Wizeline"
  "kubernetes.io/role/internal-elb" = "1"
}

prefix_name = "airflow"

cidr                        = "10.0.0.0/16"
private_subnets             = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets              = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
instance_type_group1        = "t2.medium"
instance_type_group2        = "t2.medium"
asg_desired_capacity_group1 = 1
asg_desired_capacity_group2 = 1
cluster_version             = "1.15"





