provider "aws" {
  profile = "sandbox" // default if you do not have custom profiles
  region  = "us-east-1"
}

resource "aws_instance" "wordpress" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  user_data = file("script.sh")
  tags = {
    Name = "wordpress"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier           = "sample"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
  skip_final_snapshot  = true
}

