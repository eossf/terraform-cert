# Variables, validation

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
- add a condition to internal_port
- add a file outputs.tf that outputs "container-name" and contains variables

## Outcome
just do a t plan or apply to verify
