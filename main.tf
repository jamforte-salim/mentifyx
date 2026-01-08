terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "test_vm" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.test_subnet.id
  vpc_security_group_ids = [aws_security_group.test_sg.id]

  tags = {
    Name = "test-vm"
  }
}

resource "aws_s3_bucket" "mentifyx_bucket" {
  bucket = "mentifyx-bucket"

  tags = {
    Name        = "mentifyx-bucket"
    Environment = "Test"
  }
}