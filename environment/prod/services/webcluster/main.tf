provider "aws" {
  region = "us-east-2"
}

module "webserver-cluster" {
  source = "../../../../modules/services/webserver-cluster"
  cluster_name = "webserver-prod"
  db_remote_state_bucket = "terraform-state-by-abhay"
  db_remote_state_key = "environment/prod/data-stores/mysql/terraform.tfstate"
  instance_type = "t2.micro"
  max_size = 10
  min_size = 2
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 10
  recurrence            = "0 9 * * *"
  autoscaling_group_name = module.webserver-cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_after_business_hours" {
  scheduled_action_name = "scale_in_after_business_hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 17 * * *"
  autoscaling_group_name = module.webserver-cluster.asg_name
}