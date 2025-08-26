provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "compute_engine" {
  project = var.project_id  # Replace with your GCP project ID
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

