locals {
  deployment = {
    nginx = {
      container_count = length(var.external_port[terraform.workspace])
      image          = var.image_name["nginx"][terraform.workspace]
      internal_port  = var.internal_port
      external_port  = var.external_port["nginx"][terraform.workspace]
      container_path = "/data"
    }
    influxdb = {
      container_count = length(var.external_port[terraform.workspace])
      image          = var.image_name["influxdb"][terraform.workspace]
      internal_port  = var.internal_port
      external_port  = var.external_port["influxdb"][terraform.workspace]
      container_path = "/var/lib/influxdb"
    }
  }
}

resource "random_string" "random" {
  length   = 4
  special  = false
  upper    = false
  for_each = local.deployment
}

module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}

module "container" {
  source            = "./container"
  count_in          = each.value.container_count
  for_each          = local.deployment
  name_in           = join("-", [each.key, terraform.workspace, random_string.random[each.key].result])
  image_in          = module.image[each.key].image_out
  internal_port_in  = each.value.internal_port
  external_port_in  = each.value.external_port
  container_path_in = each.value.container_path
}
