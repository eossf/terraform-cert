image_name = {
  grafana = {
    dev  = "grafana/grafana:latest"
    prod = "grafana/grafana:latest"
  }
}
internal_port = {
  grafana = {
    dev  = [3000]
    prod = [3000]
  }
}
external_port = {
  grafana = {
    dev  = [8080]
    prod = [8080]
  }
}