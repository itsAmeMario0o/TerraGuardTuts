#############################
#
#       GCP Projects
#
#############################

resource "google_project" "host-staging" {
  name = var.host_project_name
  project_id = var.host_project_id
  billing_account = var.billing_account
  org_id = var.org_id
  auto_create_network = false
}

resource "google_project" "k8s-staging" {
  name = var.service_project_id
  project_id = var.service_project_id
  billing_account = var.billing_account
  org_id = var.org_id
  auto_create_network = false
}

# Enable APIs
resource "google_project_service" "host" {
  project = google_project.host-staging.number
  service = var.projects_api
}

resource "google_project_service" "service" {
  project = google_project.k8s-staging.number
  service = var.projects_api
}