resource "kubernetes_replication_controller" "web" {
  metadata {
    generate_name = "web"
    labels {
      app = "web"
    }
  }

  spec {
    selector {
      app = "web"
    }

    template {
      container {
        image = "nginx"
        name  = "web"

        port {
          container_port = 80
        }
      }
    }
  }
}

resource "kubernetes_service" "web" {
  metadata {
    generate_name = "web"
  }

  spec {
    selector {
      app = "web"
    }

    port {
      name = "http"
      port = 80

      target_port = 80
    }

    type             = "LoadBalancer"
    load_balancer_ip = "192.168.1.250"
  }
}
