image_name = {
  influxdb = {
    dev = "quay.io/influxdb/influxdb:v2.0.0"
    prod = "quay.io/influxdb/influxdb:v2.0.0"
  }
  nginx = {
    dev = "nginx:latest"
    prod = "nginx:latest"
  } 
}
internal_port   = 8080
external_port   = {
   nginx = {
     dev = 8081
     prod = 8082
   }
   influxdb = {
     dev = 1081 
     prod = 1082
   }
}