#############################
#
#         GCP Router 
#
#############################

# We need a router for the K8s cluster to access the internet
# This allows us to pull docker images for the cluster

resource "google_compute_router" "router" {
  name = "router"
  region = var.region
  project = var.host_project_id
  network = google_compute_network.main.self_link
}