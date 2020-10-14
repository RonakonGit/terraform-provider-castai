provider "castai" {
  version = "0.0.1"
  api_url = "https://console.dev-master.cast.ai/api/"
  api_token = var.castai_api_token
}

resource "castai_credentials" "example_gcp" {
  name = "example-gcp"
  gcp {
    service_account_json = var.gcp_service_account_json
  }
}

resource "castai_credentials" "example_aws" {
  name = "example-aws"
  aws {
    access_key_id = var.aws_access_key_id
    secret_access_key = var.aws_secret_access_key
  }
}

resource "castai_credentials" "example_azure" {
  name = "example-azure"
  azure {
    service_principal_json = var.azure_service_principal_json
  }
}

resource "castai_cluster" "example_cluster" {
  name = "example-cluster"
  region = "eu-central"
  credentials = [
    castai_credentials.example_gcp.id,
    castai_credentials.example_aws.id,
  ]

  nodes {
    cloud = "aws"
    role = "master"
    shape = "small"
  }
  nodes {
    cloud = "aws"
    role = "worker"
    shape = "small"
  }
  nodes {
    cloud = "gcp"
    role = "worker"
    shape = "small"
  }
}

output "example_cluster_kubeconfig" {
  value = castai_cluster.example_cluster.kubeconfig
}