## Terraform + WordPress

- Creates an EC2 t2.micro instance and an RDS instance
- Installs WordPress on that instance


### Assumes

- You have terraform installed
- You have set up [AWS key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.htm)

### To get started:

(temporary first step): get the URL of the artifact you want and replace it on line 12 of `script.sh`

1. Set up a `.tfvars` file with `db_username`, `db_password` and your public key as `pub_key`
- Run `terraform init`
- (optionally) run `terraform plan -var-file=".tfvars"` to see changes that will be made
- Run `terraform apply -var-file=".tfvars"` to apply
- Visit you eC2 instance in AWS and visit the public IP

You can run `terraform destroy -var-file=".tfvars"` to ditch anything made.
