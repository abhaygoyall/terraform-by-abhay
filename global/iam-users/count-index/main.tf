provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "example" {
 count = length(var.user_name)
  name  = var.user_name[count.index]

}

