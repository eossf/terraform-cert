# Terraform vs Ansible

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

This is a lesson to compare Terraform and Ansible
See lesson12-ansible after

## Idempotent behavior and immutable
just apply once with count = 1 , and count = 2
