

```
terraform init
terraform fmt
terraform validate
terraform plan -out tfplan.plan
terraform show .\tfplan.plan
terraform apply tfplan.plan
```


inspecting the state
```
terraform state list
terraform state show aws_instance.app_server
<show renaming>
terraform apply (see that name changed)
terraform state rm aws_instance.app_server
terraform apply (see that it is adding a new instance cause now it doesnt know about the old one.)
//rename old istance
```

```
#rename instance/terraform apply
#change ami/terraform apply. see it's replacing the instance

```


```
terraform destroy
```