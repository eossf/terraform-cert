image_name = {
  influxdb = {
    dev  = "quay.io/influxdb/influxdb:v2.0.0"
    prod = "quay.io/influxdb/influxdb:v2.0.0"
  }
  nginx = {
    dev  = "nginx:latest"
    prod = "nginx:latest"
  }
  grafana = {
    dev  = "grafana/grafana:latest"
    prod = "grafana/grafana:latest"
  }
}
internal_port = {
  nginx = {
    dev  = [80]
    prod = [80]
  }
  influxdb = {
    dev  = [8086]
    prod = [8086]
  }
  grafana = {
    dev  = [3000]
    prod = [3000]
  }
}
external_port = {
  nginx = {
    dev  = [8081]
    prod = [8081]
  }
  influxdb = {
    dev  = [1081]
    prod = [1081]
  }
  grafana = {
    dev  = [8080]
    prod = [8080]
  }
}