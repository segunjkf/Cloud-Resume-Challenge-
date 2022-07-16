terraform {
  backend "s3" {
    bucket = "cloudresume-challenge-statefile"
    key = "Resume-statefile/state.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

 module "s3" {
   source = "./modules/s3-static"
  bucket_name = var.bucket_name
  root_bucket_name = var.root_bucket_name
 }

module "cloudfront" {
  source = "./modules/cloudfront"
  domain_name_cf = module.s3.website_endpoint
  bucket_name = var.bucket_name
  
 
}

module "dynamodb" {
  source = "./modules/dynamo"
 
}

module "lambda" {
  source = "./modules/lambda"
 
}