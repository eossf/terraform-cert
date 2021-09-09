#output "container-name" {
#    value = docker_container.this[*].name
#}

#output "ip-address" {
#    value = [for i in docker_container.this[*]: join(":", [i.ip_address], i.ports[*]["external"])]
#}

# for each container : map created "name = 'ip:ports' "
output "container_access" {
    value = {for x in docker_container.this[*]: x.name => join(":", x.ip_address[*], x.ports[*]["external"])}
}
#      "container_access" = {
#        "nginx-dev-4bid" = "172.17.0.2:8082"
#        "nginx-dev-9x84" = "172.17.0.3:8081"
#      }