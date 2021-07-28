terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered" {
  name         = "nodered/node-red:latest-minimal"
  keep_locally = true
}

resource "docker_container" "nodered" {
  count = 2
  name    = "nodered-${count.index}"
  image   = docker_image.nodered.latest
  ports {
    internal = 1880
  }
}

