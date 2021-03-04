## Terraform + WordPress

- Trial run started from [Connecting WordPress to Amazon RDS using Terraform ](https://dev.to/abhivaidya07/connecting-wordpress-to-amazon-rds-using-terraform-15bm)
- Creates an EC2 t2.micro instance and an RDS instance
- Installs WordPress on that instance


### Assumes

- You have terraform installed
- You have set up AWS key pairs

### To get started:

1. Set up a `.tfvars` file with `db_username` and `db_password`
2. Run `terraform init`
3. Run `terraform apply`
4. Visit you eC2 instance in AWS.
5. Ensure there is a security group attached with http incoming traffic allowed. If you get a timeout, there is likely not a security group attached.