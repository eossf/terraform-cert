variable "env" {
  type = string
  default = "dev"
  description = "Env to deploy"
}

variable "image" {
  type = map
  description = "Image for container"
  default = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "internal_port" {
  type = list
  default = [1880]
}

variable "container_count" {
  type = number
  default = 1
}
