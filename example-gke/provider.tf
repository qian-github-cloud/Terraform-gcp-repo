provisioner "google" {
    project = var.project_id
    region = var.regio
    
}


terraform {
    backend "gcs" {
        bucket = var.bucket_name
        prefix = var.prefix
    }
    required_version = ">= 0.12.0"
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 4.0"
        }
    }
}

