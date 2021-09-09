# map 
using map

## how to launch, still need
````bash
terraform workspace new prod
terraform workspace new dev
export TF_VAR_access_key="AKIA..."
export TF_VAR_secret_key="gAF..."
```` 

## the apply build 
CONTAINER ID   IMAGE          COMMAND                  PORTS                            NAMES
c5aded86e928   nginx:latest   "/docker-entrypoint.…"   80/tcp, 0.0.0.0:8081->8080/tcp   nginx-dev-9x84
e8ea79dbe821   nginx:latest   "/docker-entrypoint.…"   80/tcp, 0.0.0.0:8082->8080/tcp   nginx-dev-4bid
