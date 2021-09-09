# grafana deployment

## 3x containers deployment , with x = {1,2}
1 instance of nginx (ports 8081:80)
1 instance of influxdb (ports 1080:8086)
1 instance of grafana (ports 8080:3000)

## how to launch, still need
````bash
terraform workspace new prod
terraform workspace new dev
export TF_VAR_access_key="AKIA..."
export TF_VAR_secret_key="gAF..."
```` 

## result
CONTAINER ID   IMAGE                              COMMAND                  CREATED         STATUS         PORTS                    NAMES
441712c335fd   quay.io/influxdb/influxdb:v2.0.0   "/entrypoint.sh infl…"   5 seconds ago   Up 4 seconds   0.0.0.0:1081->8086/tcp   influxdb-dev-aoyc
d8e0e24d484e   nginx:latest                       "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:8081->80/tcp     nginx-dev-7qs9
a7118fa22f21   grafana/grafana:latest             "/run.sh"                5 seconds ago   Up 4 seconds   0.0.0.0:8080->3000/tcp   grafana-dev-7rq3

## Cloud9, launch grafana port 8080 ONLY!
might be something like : https://93ab9a4d146f4a69917611dc88baaa7d.vfs.cloud9.eu-west-3.amazonaws.com:8080/login

default acess = admin:admin
