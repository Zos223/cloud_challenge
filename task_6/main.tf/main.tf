#totalnie pogubilam sie w tym zadaniu i w zasadzie nic mi nie wychodzi:/ 

provider "google" {
  project = "nth-anchor-401620"
  region  = "us-central1"
  zone    = "us-central1-c"
}


resource "google_storage_bucket" "example_bucket" {
  name          = "example-bucket-tf"
  location      = "us-central1"
  force_destroy = true  # WARNING: This allows Terraform to delete all objects in the bucket during destruction

  uniform_bucket_level_access = true
  
  iam_configuration {
    bindings {
      members = ["allUsers"]
      role    = "roles/storage.objectViewer"
    }
  }
}

#2
resource "google_storage_bucket" "example_bucket" {
  name          = "example-bucket-zos223"
  location      = "us-central1"
  force_destroy = true 

  uniform_bucket_level_access = true  
  
  iam_configuration {
    bindings {
      members = ["allUsers"]
      role    = "roles/storage.objectViewer"
    }
  }
}

#4
resource "google_sql_database_instance" "example_sql_instance" {
  name             = "example-sql-instance-tf"
  database_version = "POSTGRES_13"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro" 

    user_labels = {
      managed_by_terraform = "true"
    }
  }

  # PostgreSQL database
  database {
    name = "dareit"
  }

  # PostgreSQL user
  user {
    name     = "dareit_user"
    password = "niewiemjakiehaslo" 
  }
}