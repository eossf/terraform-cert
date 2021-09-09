#output "container-name" {
#  value = flatten(module.container.container-name)
#}
#output "ip-address" {
#  value = flatten(module.container.ip-address)
#}

output "app_access_root" {
    value = [for x in module.container[*]: x]
}