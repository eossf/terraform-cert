module "container" {
  source           = "git@github.com:eossf/tf-docker-container.git?ref=v1.2"
  for_each         = local.deployment
  count_in         = each.value.container_count
  name_in          = each.key
  internal_port_in = each.value.internal_port
  external_port_in = each.value.external_port
  volumes_in       = each.value.volumes
  image_in         = each.value.image
}