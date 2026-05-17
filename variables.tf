variable "mongodb_atlas_public_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_private_key" {
  type      = string
  sensitive = true
}

variable "project_id" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "kevin-mongo"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "access_list_ip" {
  type = string
}