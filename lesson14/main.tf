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
    command = "sleep 10 && mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/ "
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

# Create a docker container resource
resource "docker_container" "nodered" {
depends_on = [null_resource.noderedvol]
  count = var.container_count
  name    = join("-", ["nodered", random_string.random[count.index].result])
#  name    = join("-", ["nodered", null_resource.noderedvol.id, random_string.random[count.index].result])
  image   = module.image.docker_out
  ports {
    internal = var.internal_port
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/noderedvol"
  } 
}