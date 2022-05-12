---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "castai_eks_cluster Resource - terraform-provider-castai"
subcategory: ""
description: |-
  EKS cluster resource allows connecting an existing EKS cluster to CAST AI.
---

# castai_eks_cluster (Resource)

EKS cluster resource allows connecting an existing EKS cluster to CAST AI.

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- **account_id** (String) ID of AWS account
- **name** (String) name of your EKS cluster
- **region** (String) AWS region where the cluster is placed

### Optional

- **access_key_id** (String, Sensitive) AWS access key ID of the CAST AI IAM account
- **assume_role_arn** (String) AWS ARN for assume role that should be used instead of IAM account
- **delete_nodes_on_disconnect** (Boolean) Should CAST AI remove nodes managed by CAST AI on disconnect
- **dns_cluster_ip** (String) Overrides the IP address to use for DNS queries within the cluster. Defaults to 10.100.0.10 or 172.20.0.10 based on the IP address of the primary interface
- **id** (String) The ID of this resource.
- **instance_profile_arn** (String) AWS ARN of the instance profile to be used by CAST AI
- **override_security_groups** (List of String) Optional custom security groups for the cluster. If not set security groups from the EKS cluster configuration are used.
- **secret_access_key** (String, Sensitive) AWS secret access key of the CAST AI IAM account
- **ssh_public_key** (String) Accepted values are base64 encoded SSH public key or AWS key pair ID.
- **subnets** (List of String) Custom subnets for the cluster. If not set subnets from the EKS cluster configuration are used.
- **tags** (Map of String) Tags which should be added to CAST AI nodes
- **timeouts** (Block, Optional) (see [below for nested schema](#nestedblock--timeouts))

### Read-Only

- **agent_token** (String, Sensitive, Deprecated)
- **credentials_id** (String) CAST AI internal credentials ID
- **security_groups** (List of String) IDs of security groups that are used by CAST AI

<a id="nestedblock--timeouts"></a>
### Nested Schema for `timeouts`

Optional:

- **create** (String)
- **delete** (String)
- **update** (String)

