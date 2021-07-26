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

variable "external_port" {
  type = map
  validation {
    condition = min(var.external_port["dev"]...) >= 1880 && max(var.external_port["dev"]...) <= 1890
    error_message = "The port is to be in the range of 1880-1890."
  }
  validation {
    condition = min(var.external_port["prod"]...) >= 8880 && max(var.external_port["prod"]...) <= 8890
    error_message = "The port is to be in the range of 1880-1890."
  }
}

locals {
  container_count = length(lookup(var.external_port,var.env))
}
