provider "aws" {
 region = "ap-northeast-2"
}

terraform {
 backend "s3" {
 # Replace this with your bucket name!
 bucket = "terraform-ssg-bin"
 key = "stage/data-stores/mysql/terraform.tfstate"
 region = "ap-northeast-2"
 # Replace this with your DynamoDB table name!
 dynamodb_table = "terraform-locks"
 encrypt = true
 }
}

resource "aws_db_instance" "example" {
 identifier_prefix = "terraform-mysql"
 engine = "mysql"
 allocated_storage = 10
 instance_class = "db.t3.micro"
 skip_final_snapshot = true
 db_name = "example_database"
 # How should we set the username and password?
 username = var.db_username
 password = var.db_password
}

variable "db_username" {
 description = "The username for the database"
 type = string
 sensitive = true
}

variable "db_password" {
 description = "The password for the database"
 type = string
 sensitive = true
}

output "address" {
 value = aws_db_instance.example.address
 description = "Connect to the database at this endpoint"
}
output "port" {
 value = aws_db_instance.example.port
 description = "The port the database is listening on"
}

