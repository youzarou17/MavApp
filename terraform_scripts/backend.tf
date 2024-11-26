terraform {
  backend "gcs" {
      credentials = "terraform-gcp-442316-0ac23c42c967.json"
      bucket = "projects_registry"
      prefix = "workspaces"
  }
}

