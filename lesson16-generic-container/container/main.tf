# Create a docker container resource
resource "docker_container" "this" {
  name    = var.name_in
  image   = var.image_in
  ports {
    internal = var.internal_port_in
    external = var.external_port_in
  }
  volumes {
    container_path = var.container_path_in
    volume_name = "${var.name_in}-volume"
  } 
}