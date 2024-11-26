resource "google_storage_bucket" "terraform_state_bucket" {
  name          = var.gcp_svc_bucket_name
  location      = var.gcp_svc_region # Choose your desired location
  force_destroy = true # Enable force destroy to allow bucket deletion
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}