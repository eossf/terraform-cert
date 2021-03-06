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
  count = 2
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
  count = 2
  name    = join("-", ["nodered", random_string.random[count.index].result])
  image   = docker_image.nodered.latest
  ports {
    # external = 1880 + random_string.random.index
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
  value = [for i in docker_container.nodered[*]: join(":", [i.ip_address,i.ports[0].internal])]
  description = "The IP address:port of the container"
}

output "container-name" {
  value = docker_container.nodered[*].name
  description = "The name of the container"
}
