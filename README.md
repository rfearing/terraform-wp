## Terraform + WordPress

- Trial run started from [Connecting WordPress to Amazon RDS using Terraform ](https://dev.to/abhivaidya07/connecting-wordpress-to-amazon-rds-using-terraform-15bm)
- Creates an EC2 t2.micro instance and an RDS instance
- Installs WordPress on that instance


### Assumes

- You have terraform installed
- You have set up AWS key pairs

### To get started:

1. Set up a `.tfvars` file with `db_username` and `db_password`
- Run `terraform init`
- (optionally) run `terraform plan -var-file=".tfvars"` to see changes that will be made
- Run `terraform apply -var-file=".tfvars"` to apply
- Visit you eC2 instance in AWS and visit the public IP

You can run `terraform destroy` to ditch anything made.