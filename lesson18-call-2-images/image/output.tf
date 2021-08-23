output "image_out" {
    value = docker_image.this.latest
}
output "name_out" {
    value = var.name_in
}
