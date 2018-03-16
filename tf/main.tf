module "consul" {
  source = "./modules/consul"
}

module "secrets" {
  source = "./modules/secrets"
}

module "web" {
  source = "./modules/web"

  load_balancer_ips = "${var.web_load_balancer_ips}"
}
