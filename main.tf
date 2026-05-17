terraform {
  required_version = ">= 1.5.0"

  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.18"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}

resource "mongodbatlas_cluster" "my_cluster" {
  project_id = var.project_id
  name       = var.cluster_name

  provider_name               = "TENANT"
  backing_provider_name       = "AZURE"
  provider_region_name        = "US_EAST_2"
  provider_instance_size_name = "M0"

  mongo_db_major_version = "8.0"
}

resource "mongodbatlas_database_user" "my_user" {
  username           = var.db_username
  password           = var.db_password
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}

resource "mongodbatlas_project_ip_access_list" "my_ipaddress" {
  project_id = var.project_id
  ip_address = var.access_list_ip
  comment    = "Allow My IP"
}

output "connection_string" {
  value = mongodbatlas_cluster.my_cluster.connection_strings[0].standard_srv
}