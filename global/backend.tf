terraform {
 backend "s3" {
   bucket = "terraform-ssg-bin"
   key = "workspaces-example/terraform.tfstate"
   region = "ap-northeast-2"
   dynamodb_table = "terraform-locks"
   encrypt = true
 }
}