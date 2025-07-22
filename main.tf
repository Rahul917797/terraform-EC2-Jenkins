terraform {
  backend "s3" {
    bucket         = "rahul-example-917797"   # Replace with your S3 bucket name
    key            = "prod/terraform.tfstate"      # Path inside the bucket for your state file
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"             # DynamoDB table for locking
    encrypt        = true
    use_locking = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "MyInstance" {
  ami = "ami-020cba7c55df1f615"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  key_name = "mydevops-key"
  vpc_security_group_ids = ["sg-05fc81ae50bfcba78"]
  
  tags = {
    Name = "jenkins-terraform"
         }
}
