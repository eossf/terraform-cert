# Manually operations consequences - refresh

## remove manually resource
- edit main.tf
- create 4 resources (count=4) of docker container nodered
- then rm manually one (docker rm nodered-rNHR...)

```bash
$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                            PORTS                     NAMES
ccf54f5a851e   04fa5935c931   "npm --no-update-not…"   4 seconds ago   Up 2 seconds (health: starting)   0.0.0.0:49172->1880/tcp   nodered-xQ3v
b1baa7daccdd   04fa5935c931   "npm --no-update-not…"   4 seconds ago   Up 2 seconds (health: starting)   0.0.0.0:49171->1880/tcp   nodered-g2Rf
621281d2817e   04fa5935c931   "npm --no-update-not…"   4 seconds ago   Up 2 seconds (health: starting)   0.0.0.0:49170->1880/tcp   nodered-rNHR
f1e8be7c8df3   04fa5935c931   "npm --no-update-not…"   8 minutes ago   Up 8 minutes (healthy)            0.0.0.0:1880->1880/tcp    nodered-6xNX

$ docker kill nodered-rNHR -f

$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                    PORTS                     NAMES
ccf54f5a851e   04fa5935c931   "npm --no-update-not…"   56 seconds ago   Up 55 seconds (healthy)   0.0.0.0:49172->1880/tcp   nodered-xQ3v
b1baa7daccdd   04fa5935c931   "npm --no-update-not…"   56 seconds ago   Up 55 seconds (healthy)   0.0.0.0:49171->1880/tcp   nodered-g2Rf
f1e8be7c8df3   04fa5935c931   "npm --no-update-not…"   9 minutes ago    Up 9 minutes (healthy)    0.0.0.0:1880->1880/tcp    nodered-6xNX
````

## Outcome
the state DOES NOT reflect the removing container

## Refresh
for updating the state configuration, but not the main.tf file

````bash
$ t refresh

$ t state list
docker_container.nodered[0]
docker_container.nodered[2]
docker_container.nodered[3]

$ t show --json | jq ".values.root_module.resources" | grep "name" | grep "nodered-"
"name": "nodered-Rgb2",
"name": "nodered-EAIx",
"name": "nodered-Gtwp",

$ cat terraform.tfstate | jq ".resources[0].instances" | grep "nodered-"
"name": "nodered-Rgb2",
"name": "nodered-EAIx",
"name": "nodered-Gtwp",
````

## Return back to normal situation
the container is recreated

````bash
$ t apply --auto-approve

$ t show --json | jq ".values.root_module.resources" | grep "name" | grep "nodered-"
"name": "nodered-LCRu",
"name": "nodered-QHuB",
"name": "nodered-gjFU",
"name": "nodered-Rjd1",
````

