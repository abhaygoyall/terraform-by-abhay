provider "aws" {
  region = "us-east-2"
}

terraform {

  backend "s3" {
    bucket = "terraform-state-by-abhay"
    key    = "environment/prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
  }
}
resource "aws_db_instance" "db" {
  identifier_prefix   = "terraform-by-abhay"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
  db_name             = var.db_name
  username         = var.db_username
  password         = var.db_password
}