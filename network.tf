resource "google_compute_network" "doc_store_vpc" {
  project                 = var.project_id
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "frankfurt_subnet" {
  project       = var.project_id
  name          = "frankfurt-subnet"
  ip_cidr_range = "10.0.1.0/20"
  region        = "europe-west3"            # Frankfurt
  network       = google_compute_network.doc_store_vpc.self_link
}

resource "google_compute_subnetwork" "berlin_subnet" {
  project       = var.project_id
  name          = "berlin-subnet"
  ip_cidr_range = "10.0.2.0/20"
  region        = "europe-west10"           # Berlin
  network       = google_compute_network.doc_store_vpc.self_link
}
