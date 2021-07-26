# Lookup

## common steps before starting

Model file is replacing the main.tf file for starting the exercise without the solution
Don't forget : to retrieve aws metadat: http://169.254.169.254/latest/meta-data/

```bash
alias t='terraform'
alias ll='ls -ltrhA'
t destroy
t init
cp -f model main.tf
cp -f variables variables.tf
````

## steps to do
- add env variable for dev, prod
- add image variable, one for prod and dev, according to the env above
  dev = "nodered/node-red:latest"
  prod = "nodered/node-red:latest-minimal"
- for the external port do the same , env=1880 and prod=80
- add a condition on the var
  for dev >=1880 <=1890
  for dev >=8880 <=8890

## Outcome
just do a plan or apply to verify