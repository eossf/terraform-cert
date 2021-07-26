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
  type = number
  default = 1880
}

variable "container_count" {
  type = number
  default = 1
}

# Configure the docker provider
provider "docker" {
}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/"
  }
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
  volumes {
    container_path = "/data"
    host_path = "/home/ubuntu/terraform-cert/lesson9/noderedvol"
  }
}

output "container-name" {
  value = docker_container.nodered[*].name
  description = "The name of the container"
}

output "port" {
  value = var.internal_port
  description = "The port of the container"
}