locals {
  deployment = {
    nginx = {
      image = var.image_name["nginx"]
    }
    influxdb = {
      image = var.image_name["influxdb"]
    }
    
  }
}

resource "random_string" "random" {
  length = 4
  special = false
  count = var.container_count
}

module "image" {
  source = "./image"
  for_each = local.deployment
  image_in = each.value.image
}

module "container" {
  source = "./container"
  count = var.container_count
  name_in  = join("-", ["image", random_string.random[count.index].result])
  image_in = module.image["nginx"].image_out
  internal_port_in = var.internal_port
  external_port_in = var.external_port[count.index]
  container_path_in = "/data"
  container_host_path_in = "${path.cwd}/noderedvol/"
}