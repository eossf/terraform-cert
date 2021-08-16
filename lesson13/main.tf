terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
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
  docker_in = var.image_name
}

# Create a docker container resource
resource "docker_container" "nodered" {
  count = var.container_count
  name    = join("-", ["nodered", random_string.random[count.index].result])
  image   = module.image.docker_out
  ports {
    internal = var.internal_port
  }
}