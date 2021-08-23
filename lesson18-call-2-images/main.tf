resource "random_string" "random" {
  length = 4
  special = false
  count = var.container_count
}

module "nginx" {
  source = "./image"
  image_in = var.image_name["nginx"]
  name_in = "NGINX"
}

module "influxdb" {
  source = "./image"
  image_in = var.image_name["influxdb"]
  name_in = "influxdb"
}

module "container" {
  source = "./container"
  count = var.container_count
  name_in  = join("-", ["${module.nginx.name_out}", random_string.random[count.index].result])
  image_in = module.nginx.image_out
  internal_port_in = var.internal_port
  external_port_in = var.external_port[count.index]
  container_path_in = "/data"
  container_host_path_in = "${path.cwd}/noderedvol/"
}