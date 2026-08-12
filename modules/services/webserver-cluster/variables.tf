variable "server_port" {
  description = "The port on which the web server will listen"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name of the web server cluster"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The S3 bucket name for storing the remote state of the database"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the web servers"
  type        = string
}

variable "min_size" {
  description = "The minimum number of instances in the web server cluster"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the web server cluster"
  type        = number
}
