provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  source = "../../../../modules/services/webserver-cluster"
  cluster_name = "webserver-stage"
  db_remote_state_bucket = "terraform-state-by-abhay"
  db_remote_state_key = "environment/stage/data-stores/mysql/terraform.tfstate"
  instance_type = "t2.micro"
  max_size = 2
  min_size = 2
}
