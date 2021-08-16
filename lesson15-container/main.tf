terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

resource "null_resource" "noderedvol" {
  provisioner "local-exec" {
    command = "sleep 2 && mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/ "
  }
}
resource "random_string" "random" {
  length = 4
  special = false
  count = var.container_count
}

module "image" {
  source = "./image"
  docker_in = var.image_name
}

module "container" {
  source = "./container"
  depends_on = [null_resource.noderedvol]
  count = var.container_count
  name_in  = join("-", ["nodered", random_string.random[count.index].result])
  image_in = module.image.image_out
  internal_port_in = var.internal_port
  external_port_in = var.external_port[count.index]
  container_path_in = "/data"
  container_host_path_in = "${path.cwd}/noderedvol/"
}