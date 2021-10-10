variable "main_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.main_region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.main_region
}

module "ec2" {
  source = "./modules/ec2"
  subnets  =  keys(module.vpc.privatesubnet01)
  vpc_id  = module.vpc.vpcid
  #vpc_security_group_ids = keys(module.vpc.ssh)
  }





