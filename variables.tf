variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "pub_key" {
  description = "Public Key Pair"
  type        = string
  sensitive   = true
}