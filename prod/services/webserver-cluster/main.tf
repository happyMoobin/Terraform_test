provider "aws" {
 region = "ap-northeast-2"
}
module "webserver_cluster" {
 source = "../../../modules/services/webserver-cluster"

    cluster_name = "webserver-prod"
    db_remote_state_bucket = "terraform-ssg-bin"
    db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
    server_port = "8080"
}

output "lb_dns" {
 value = module.webserver_cluster.alb_dns_name
 description = "The domain name of the load balancer"
}