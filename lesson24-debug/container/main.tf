module "image" {
  source   = "../image"
  image_in = var.image_in
}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
  count   = var.count_in
}

resource "docker_container" "this" {
  count = var.count_in
  name  = join("-", [var.name_in, terraform.workspace, random_string.random[count.index].result])
  image = var.image_in
  ports {
    internal = var.internal_port_in[count.index]
    external = var.external_port_in[count.index]
  }
  volumes {
    container_path = var.container_path_in
    volume_name    = docker_volume.this[count.index].name
  }
  provisioner "local-exec" {
    when    = create
    command = "mkdir ${path.cwd}/../BACKUP/"
    on_failure = continue
  }  
  provisioner "local-exec" {
    when = create 
    command = "touch ${path.cwd}/../BACKUP/container.txt"
  }  
  provisioner "local-exec" {
    when = create 
    command = "echo ${self.name} ${self.ip_address}:${join("", [for p in self.ports[*]["external"]:p])} >> ${path.cwd}/../BACKUP/container.txt"
  }
}

resource "docker_volume" "this" {
  count = var.count_in
  name  = "${var.name_in}-${random_string.random[count.index].result}-volume"
  lifecycle {
    prevent_destroy = false
  }
  provisioner "local-exec" {
    when    = destroy
    command = "sudo tar -czvf ${path.cwd}/../BACKUP/${self.name}.tar.gz ${self.mountpoint}/"
    on_failure = fail
  }
}