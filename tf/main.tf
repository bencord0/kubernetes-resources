module "web" {
  source = "./web"

  load_balancer_ip = "192.168.1.250"
}

output "web_ip" {
  value = "${module.web.web_ip}"
}
