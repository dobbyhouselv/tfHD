variable "ssh_username" {
  type        = string
  description = "user account to login into Linux Host"
}

variable "ssh_pub_key" {
  type        = string
  description = "ssh public key file to grant access my ssh key"
}

variable "customdata_file" {
  type = string
  description = "ssh customdata file to provide initial updates and additional user i.e. ansible"
}