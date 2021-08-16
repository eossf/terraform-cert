# Create a docker container resource
resource "docker_container" "nodered" {
  name    = var.name_in
  image   = var.image_in
  ports {
    internal = var.internal_port_in
    external = var.external_port_in
  }
  volumes {
    container_path = var.container_host_path_in
    host_path = var.container_host_path_in
  } 
}