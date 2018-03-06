module "consul" {
  source = "./consul"
}

module "secrets" {
  source = "./secrets"
}

module "web" {
  source = "./web"

  load_balancer_ips = "${var.web_load_balancer_ips}"
}

output "web_ip" {
  value = "${module.web.web_ip}"
}
