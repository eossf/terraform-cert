# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

# Configure the docker provider
provider "docker" {
}

resource "random_string" "random" {
  length = 4
  special = false
  count = var.container_count
}

resource "docker_image" "nodered" {
  name         = "nodered/node-red:latest"
  keep_locally = true
}

# Create a docker container resource
resource "docker_container" "nodered" {
  count = var.container_count
  name    = join("-", ["nodered", random_string.random[count.index].result])
  image   = docker_image.nodered.latest
  ports {
    internal = var.internal_port
  }
}