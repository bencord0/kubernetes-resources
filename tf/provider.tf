provider "kubernetes" {}

provider "consul" {
  address    = "consul.condi.me"
  scheme     = "https"

  token = "${var.consul_token}"
}

provider "pass" {}
