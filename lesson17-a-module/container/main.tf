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
    volume_name = docker_volume.this.name
  }
}

resource "docker_volume" "this" {
  name = "${var.name_in}-x-volume"
  lifecycle {
    prevent_destroy = false
  }
}