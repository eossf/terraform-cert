resource "random_string" "random" {
  length  = 4
  special = false
  upper = false
  count = var.count_in
}

resource "docker_container" "this" {
  count = var.count_in
  name    = join("-", [var.name_in, terraform.workspace, random_string.random[count.index].result])
  image   = var.image_in
  ports {
    internal = var.internal_port_in
    external = var.external_port_in[count.index]
  }
  volumes {
    container_path = var.container_path_in
    volume_name = docker_volume.this[count.index].name
  }
}

resource "docker_volume" "this" {
  count = var.count_in
  name = "${var.name_in}-${random_string.random[count.index].result}-volume"
  lifecycle {
    prevent_destroy = false
  }
}