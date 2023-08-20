#############################
#
#         GCP NAT Gw
#
#############################

resource "google_compute_router_nat" "mist_nat" {
  name = "nat"
  project = var.host_project_id
  router = google_compute_router.router.name
  region = var.region
  nat_ip_allocate_option = "AUTO_ONLY"
  # NAT all networks - Intended to ALSO account for pod network
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [ google_compute_subnetwork.private ]
}