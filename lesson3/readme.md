Create two instances of docker container nodered 
by "t apply" in the same time (one with --lock=false)

the outcome 
one docker container is out of state

add the new docker in main.tf and import the unmanaged container
"t import docker_container.nodered2 <CONTAINER_ID>"

see tfstate, the container is managed