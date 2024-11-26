terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
}
provider "google" {
    credentials = file(var.gcp_svc_key)
    project = var.gcp_svc_project
    region  = var.gcp_svc_region

}
