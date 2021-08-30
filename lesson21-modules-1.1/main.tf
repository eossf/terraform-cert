locals {
  deployment = {
    nginx = {
      container_count = length(var.external_port["nginx"][terraform.workspace])
      image          = var.image_name["nginx"][terraform.workspace]
      internal_port  = var.internal_port
      external_port  = var.external_port["nginx"][terraform.workspace]
      container_path = "/data"
    }
  }
}

module "container" {
  source            = "./container"
  for_each          = local.deployment
  count_in          = each.value.container_count
  name_in           = each.key
  internal_port_in  = each.value.internal_port
  external_port_in  = each.value.external_port
  container_path_in = each.value.container_path
  image_in          = each.value.image
}