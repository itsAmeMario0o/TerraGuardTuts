# Cloud Network Automation

Before executing the scripts in this directory ensure the following:

1. AWS CLI has been configured:

[AWS - User | Key and CLI Configuration ](https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html)

** NOTE ** The above does not reflect AWS best practices.

2. Terraform is working on your system `terraform -v`

3. Create a new file in this directory called `terraform.tfvars`

    Paste the following:

    `region = "us-east-1"`

    `main_vpc_cidr = "10.0.0.0/16"`

    `public_subnets = "10.0.10.0/24"`

    `private_subnets = "10.0.100.0/24"`