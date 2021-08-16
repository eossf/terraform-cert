resource "docker_image" "nodered" {
  name         = var.docker_in
  keep_locally = true
}