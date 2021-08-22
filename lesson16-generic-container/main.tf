resource "random_string" "random" {
  length = 4
  special = false
  count = var.container_count
}

module "image" {
  source = "./image"
  image_in = var.image_name
}

module "container" {
  source = "./container"
  count = var.container_count
  name_in  = join("-", ["nodered", random_string.random[count.index].result])
  image_in = var.image_name
  internal_port_in = var.internal_port
  external_port_in = var.external_port[count.index]
  container_path_in = "/data"
  container_host_path_in = "${path.cwd}/noderedvol/"
}