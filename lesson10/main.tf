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

# variable must be input or set when running terraform
# could be export TF_VAR_internal_port=
variable "internal_port" {
  type = list
  default = [1880, 1881, 1882, 1883]
}

locals {
  container_count = length(var.internal_port)
}

# Configure the docker provider
provider "docker" {
}

resource "random_string" "random" {
  length = 4
  special = false
  count = local.container_count
}

resource "docker_image" "nodered" {
  name         = "nodered/node-red:latest"
  keep_locally = true
}

# Create a docker container resource
resource "docker_container" "nodered" {
  count = local.container_count
  name    = join("-", ["nodered", random_string.random[count.index].result])
  image   = docker_image.nodered.latest
  ports {
    internal = min(var.internal_port[count.index],1880)
  }
}

output "container-name" {
  value = docker_container.nodered[*].name
  description = "The name of the container"
}

