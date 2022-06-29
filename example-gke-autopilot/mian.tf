provider "google" {
  project     = "develop-mororepo"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-a"
  credentials = file("/home/qian/Developer/develop-mororepo-user.json")
}


terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 4.3.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-example-kbuntu"
    prefix = "terraform-state"
  }
}

resource "google_container_cluster" "primary" {
  name     = "test-terraform-to-create-cluster"
  location = "asia-northeast1"

  network    = "test-global"
  subnetwork = "test-global"

  enable_autopilot = true
}