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

# Create a docker image resource
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
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
    external = 1880
    internal = 1880
  }
}

resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest

  ports {
    external = 8080
    internal = 80
  }
}

output "IP-Address" {
  value = join(":", [docker_container.nodered.ip_address, docker_container.nodered.ports[0].internal])
  description = "The IP address:port of the container"
}

output "container-name" {
  value = docker_container.nodered.name
  description = "The name of the container"
}
