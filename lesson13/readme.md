# Modules

## common steps before starting

Model file is replacing the main.tf file for starting the exercise without the solution

```bash
alias t='terraform'
alias ll='ls -ltrhA'
t destroy
t init
cp -f model main.tf
````

## steps to do
add module called "image" for the docker provider
- create variable.tf definition and tfvars
- set port 1880
- set number of containers (for example 1)
- set and inject the container name into the module (input = variable)
- get container name from the module (output)

## Outcome
just do a plan or apply to verify 