# dev infrastructure
module "dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "infra-app-bucket-1519"
    count_instance = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-00ca570c1b6d79f36" #Amazon Linux
    hash_key = "studentID"
  
}

# prd infrastructure
module "prd-infra" {
    source = "./infra-app"
    env = "prd"
    bucket_name = "infra-app-bucket-1519"
    count_instance = 2
    instance_type = "t3.micro"
    ec2_ami_id = "ami-00ca570c1b6d79f36" #Amazon Linux
    hash_key = "studentID"
  
}

# stg infrastructure
module "stg-infra" {
    source = "./infra-app"
    env = "stg"
    bucket_name = "infra-app-bucket-1519"
    count_instance = 1
    instance_type = "t3.micro"
    ec2_ami_id = "ami-00ca570c1b6d79f36" #Amazon Linux
    hash_key = "studentID"
  
}