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
 # subnet_id     =  module.vpc.subnet_idd
  vpc_id  = module.vpc.vpcid

  
    
  }
  



