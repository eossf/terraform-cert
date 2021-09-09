output "root_module" {
  value = [for x in module.container[*] : x]
}