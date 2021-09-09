locals {
  deployment = {
    nginx = {
      container_count = length(var.external_port["nginx"][terraform.workspace])
      image           = var.image_name["nginx"][terraform.workspace]
      internal_port   = var.internal_port["nginx"][terraform.workspace]
      external_port   = var.external_port["nginx"][terraform.workspace]
      container_path  = "/data"
    }
    influxdb = {
      container_count = length(var.external_port["influxdb"][terraform.workspace])
      image           = var.image_name["influxdb"][terraform.workspace]
      internal_port   = var.internal_port["influxdb"][terraform.workspace]
      external_port   = var.external_port["influxdb"][terraform.workspace]
      container_path  = "/var/lib/influxdb"
    }
    grafana = {
      container_count = length(var.external_port["grafana"][terraform.workspace])
      image           = var.image_name["grafana"][terraform.workspace]
      internal_port   = var.internal_port["grafana"][terraform.workspace]
      external_port   = var.external_port["grafana"][terraform.workspace]
      container_path  = "/var/lib/grafana"
    }
  }
}