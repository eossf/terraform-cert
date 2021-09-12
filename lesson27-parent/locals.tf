locals {
  deployment = {
    grafana = {
      container_count = length(var.external_port["grafana"][terraform.workspace])
      image           = var.image_name["grafana"][terraform.workspace]
      internal_port   = var.internal_port["grafana"][terraform.workspace]
      external_port   = var.external_port["grafana"][terraform.workspace]
      volumes = [
        { container_path = "/var/lib/grafana" },
        { container_path = "/etc/grafana" }
      ]
    }
  }
}