# variable must be input or set when running terraform
# could be export TF_VAR_internal_port=
variable "internal_port" {
  type = number
  default = 1880
  validation {
    condition = var.internal_port == 1880
    error_message = "The Port internal is fixed to 1880."
  }
}

variable "container_count" {
  type = number
  default = 1
}

output "container-name" {
  value = docker_container.nodered[*].name
  description = "The name of the container"
}
