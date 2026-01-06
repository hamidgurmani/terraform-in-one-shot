variable "env" {
    description = "this is the nvironment for my infra app"
    type = string  
}

variable "bucket_name" {
    description = "this is the bucket name for my infra app"
    type = string
}

variable "count_instance" {
    description = "this is the no of ec2 insance"
    type = number
}

variable "instance_type" {
    description = "ths is the instance type for my infra app"
    type = string
}

variable "ec2_ami_id" {
    description = "ths is the ami of  instance for my infra app"
    type = string
}

variable "hash_key" {
    description = "ths is the hash key of  instance for my infra app"
    type = string
  
}
