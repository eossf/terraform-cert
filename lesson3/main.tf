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
}

resource "docker_image" "nodered" {
  name         = "nodered/node-red:latest"
  keep_locally = true
}

# Create a docker container resource
resource "docker_container" "nodered" {
  name    = join("-", ["nodered", random_string.random.result])
  image   = docker_image.nodered.latest
  ports {
    # external = 1880 + random_string.random.index
    internal = 1880
  }
}

# resource imported
resource "docker_container" "nodered2" {
  name    = "nodered-ZH4i"
  image   = docker_image.nodered.latest
}



output "IP-Address" {
  value = docker_container.nodered[*].ports[0].internal
  description = "The IP address:port of the container"
}

output "container-name" {
  value = docker_container.nodered[*].name
  description = "The name of the container"
}
