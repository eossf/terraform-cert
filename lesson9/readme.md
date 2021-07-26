# Bind Mount local

## common steps before starting

Model file is replacing the main.tf file for starting the exercise without the solution

```bash
alias t='terraform'
alias ll='ls -ltrhA'
t destroy
t init
cp -f model main.tf
````

## create a local volume resource, attached to docker container
- locally in terraform, noderedvol/ 
- modify the container nodered, link container path /data the hostpath (volume created above)
  (host_path MUST be FQDN i.e. /home/...)
- add a dynamic path, get path.cwd from terraform (use string interpolation)

## Outcome
the volume contains lib/ and node_modules + js and json files
