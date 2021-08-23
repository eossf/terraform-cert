variable "image_name" {
    type = map
    description = "The image of the container"
    default = {
        influxdb = "quay.io/influxdb/influxdb:v2.0.0"
        nginx = "nginx:latest"
    }
}
variable "internal_port" {}
variable "external_port" {}
variable "container_count" {}
variable "access_key" {}
variable "secret_key" {}