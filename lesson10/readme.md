# Local Variables and misc function

Local variable allows function called (= length, ... ). That's not possible in tfvars , or in resource (get a count = lenght of an array for example).

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
- change the internal_port to list type, set two elements in the array: 1880, 1881 ...
- turn container_count to a locals vith value length(array) above
- add a max function with 1880
- add a min , still 1880

## Outcome
just do a plan or apply to verify 