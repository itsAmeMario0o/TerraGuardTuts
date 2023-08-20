# Google Kubernetes Engine Automation

Before executing the scripts in this directory ensure the following:

1. A GCP account and the gcloud SDK installed:

[ Provision a GKE cluster | Prerequisites ](https://developer.hashicorp.com/terraform/tutorials/kubernetes/gke)

2. Terraform is working on your system `terraform -v`

3. Create a new file in this directory called `terraform.tfvars`

    Paste the following:

    `region = "us-east4"`

    `host_project_name = "HostProj-${random_integer.int.result}"`

    `service_project_name = "SvcProj-${random_integer.int.result}"`

    `projects_api = "container.googleapi.com"`

    `secondary_ip_ranges = {`
        `"pod_ip_range" = "10.0.0.0/14",`
        `"services_ip_range" = "10.4.0.0/19"`
    `}`