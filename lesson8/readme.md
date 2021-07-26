# Variables external injection

## common steps before starting

Model file is replacing the main.tf file for starting the exercise without the solution

```bash
alias t='terraform'
alias ll='ls -ltrhA'
t destroy
t init
cp -f model main.tf
````

## remove manually resource
- add variable in tfvars file (terraform.tfvars is automatically read by default)
- add a second tfvars file and add a different port : 1900 (remove the condidion == 1880)

## Outcome
```bash
# to select the properfile do 
t plan -var-file=second.tfvars

````