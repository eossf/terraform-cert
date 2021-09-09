image_name = {
  nodered = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest"
  }
  influxdb = {
    dev  = "quay.io/influxdb/influxdb:v2.0.0"
    prod = "quay.io/influxdb/influxdb:v2.0.0"
  }
  grafana = {
    dev  = "grafana/grafana:latest"
    prod = "grafana/grafana:latest"
  }
}
internal_port = {
  nodered = {
    dev  = [1880]
    prod = [1880]
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
  nodered = {
    dev  = [8881]
    prod = [8881]
  }
  influxdb = {
    dev  = [8086]
    prod = [8086]
  }
  grafana = {
    dev  = [8080]
    prod = [8080]
  }
}