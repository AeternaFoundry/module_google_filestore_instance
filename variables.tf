variable "filestore_instances" {
  description = <<EOT
Map of filestore_instances, attributes below
Required:
    - name
    - tier
    - file_shares (block):
        - capacity_gb (required)
        - name (required)
        - nfs_export_options (optional, block):
            - access_mode (optional)
            - anon_gid (optional)
            - anon_uid (optional)
            - ip_ranges (optional)
            - network (optional)
            - squash_mode (optional)
        - source_backup (optional)
        - source_backupdr_backup (optional)
    - networks (block):
        - connect_mode (optional)
        - modes (required)
        - network (required)
        - psc_config (optional, block):
            - endpoint_project (optional)
        - reserved_ip_range (optional)
Optional:
    - deletion_policy
    - deletion_protection_enabled
    - deletion_protection_reason
    - description
    - desired_replica_state
    - kms_key_name
    - labels
    - location
    - project
    - protocol
    - tags
    - zone
    - directory_services (block):
        - ldap (optional, block):
            - domain (required)
            - groups_ou (optional)
            - servers (required)
            - users_ou (optional)
    - initial_replication (block):
        - replicas (optional, block):
            - peer_instance (required)
        - role (optional)
    - performance_config (block):
        - fixed_iops (optional, block):
            - max_iops (optional)
        - iops_per_tb (optional, block):
            - max_iops_per_tb (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                        = string
    tier                        = string
    deletion_policy             = optional(string)
    deletion_protection_enabled = optional(bool)
    deletion_protection_reason  = optional(string)
    description                 = optional(string)
    desired_replica_state       = optional(string)
    kms_key_name                = optional(string)
    labels                      = optional(map(string))
    location                    = optional(string)
    project                     = optional(string)
    protocol                    = optional(string)
    tags                        = optional(map(string))
    zone                        = optional(string)
    file_shares = object({
      capacity_gb = number
      name        = string
      nfs_export_options = optional(list(object({
        access_mode = optional(string)
        anon_gid    = optional(number)
        anon_uid    = optional(number)
        ip_ranges   = optional(list(string))
        network     = optional(string)
        squash_mode = optional(string)
      })))
      source_backup          = optional(string)
      source_backupdr_backup = optional(string)
    })
    networks = list(object({
      connect_mode = optional(string)
      modes        = list(string)
      network      = string
      psc_config = optional(object({
        endpoint_project = optional(string)
      }))
      reserved_ip_range = optional(string)
    }))
    directory_services = optional(object({
      ldap = optional(object({
        domain    = string
        groups_ou = optional(string)
        servers   = list(string)
        users_ou  = optional(string)
      }))
    }))
    initial_replication = optional(object({
      replicas = optional(list(object({
        peer_instance = string
      })))
      role = optional(string)
    }))
    performance_config = optional(object({
      fixed_iops = optional(object({
        max_iops = optional(number)
      }))
      iops_per_tb = optional(object({
        max_iops_per_tb = optional(number)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.filestore_instances : (
        v.file_shares.nfs_export_options == null || (length(v.file_shares.nfs_export_options) <= 10)
      )
    ])
    error_message = "Each nfs_export_options list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.filestore_instances : (
        length(v.networks) >= 1
      )
    ])
    error_message = "Each networks list must contain at least 1 items"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

