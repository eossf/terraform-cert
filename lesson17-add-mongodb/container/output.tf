output "container-name" {
    value = docker_container.this[*].name
}

output "ip-address" {
    value = [for i in docker_container.this[*]: join(":", [i.ip_address], i.ports[*]["external"])]
}