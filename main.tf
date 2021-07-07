provider "aws" {
  profile = "sandbox" // default if you do not have custom profiles
  region  = "us-east-1"
}

resource "aws_security_group" "wordpress_allow_http" {
  name        = "wordpress_allow_http"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description = "HTTP Requests"
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  user_data = file("script.sh")
  security_groups = ["${aws_security_group.wordpress_allow_http.name}"]
  key_name         = "ssh-key"
  tags = {
    Name = "wordpress"
  }
}


resource "aws_security_group" "mysql-sg" {
  name   = "mysql-security-group"
  # vpc_id = "${aws_default_vpc.default.id}"

  ingress {
    description = "WordPress Traffic"
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    security_groups = ["${aws_security_group.wordpress_allow_http.id}"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_security_group.wordpress_allow_http,
  ]
}


resource "aws_db_instance" "wpdb" {
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
  vpc_security_group_ids = [aws_security_group.mysql-sg.id]
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.pub_key
}

output "IP"  {
  value = "${aws_instance.web.public_ip}"
}

output "DB_Endpoint" {
  value = aws_db_instance.wpdb.endpoint
}
