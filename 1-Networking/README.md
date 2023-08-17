# Cloud Networking Fundamentals

This guide will walk you through the following tasks:
1. Understand cloud networking constructs
2. Learn AWS networking basics
3. Learn Terraform
4. Automate network infrastructure provisioning

Create a new file called `terraform.tfvars`

In that file paste the following:

`region = "us-east-1"`
`main_vpc_cidr = "10.0.0.0/16"`
`public_subnets = "10.0.10.0/24"`
`private_subnets = "10.0.100.0/24"`