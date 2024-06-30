# Variables for module "eks"
variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_endpoint_public_access" {
  type = bool
}

variable "cluster_addons" {
  type = map
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "control_plane_subnet_ids" {
  type = list(string)
}

variable "eks_managed_node_group_defaults" {
    type = any
}

variable "eks_managed_node_groups" {
  type = map(object({
    ami_type       = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
  }))
}

variable "enable_cluster_creator_admin_permissions" {
  type = bool
}

variable "tags" {
  type = map(string)
}

# Variables for module "karpenter"
variable "create_node_iam_role" {
  type = bool
}


variable "create_access_entry" {
  type = bool
}

variable "karpenter_tags" {
  type = map(string)
}
