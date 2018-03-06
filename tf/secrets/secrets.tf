data "pass_password" "registry" {
  path = "registry.condi.me/registry"
}

resource "kubernetes_secret" "registry" {
  metadata {
    name = "registry"
  }

  data {
    ".dockerconfigjson" = "{\"auths\": {\"registry.condi.me\": {\"auth\": \"${base64encode("registry:${data.pass_password.registry.password}")}\"}}}"
  }

  type = "kubernetes.io/dockerconfigjson"
}
