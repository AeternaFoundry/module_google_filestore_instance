resource "google_filestore_instance" "filestore_instances" {
  for_each = var.filestore_instances

  name                        = each.value.name
  tier                        = each.value.tier
  deletion_policy             = each.value.deletion_policy
  deletion_protection_enabled = each.value.deletion_protection_enabled
  deletion_protection_reason  = each.value.deletion_protection_reason
  description                 = each.value.description
  desired_replica_state       = each.value.desired_replica_state
  kms_key_name                = each.value.kms_key_name
  labels                      = each.value.labels
  location                    = each.value.location
  project                     = each.value.project
  protocol                    = each.value.protocol
  tags                        = each.value.tags
  zone                        = each.value.zone

  file_shares {
    capacity_gb = each.value.file_shares.capacity_gb
    name        = each.value.file_shares.name
    dynamic "nfs_export_options" {
      for_each = each.value.file_shares.nfs_export_options != null ? each.value.file_shares.nfs_export_options : []
      content {
        access_mode = nfs_export_options.value.access_mode
        anon_gid    = nfs_export_options.value.anon_gid
        anon_uid    = nfs_export_options.value.anon_uid
        ip_ranges   = nfs_export_options.value.ip_ranges
        network     = nfs_export_options.value.network
        squash_mode = nfs_export_options.value.squash_mode
      }
    }
    source_backup          = each.value.file_shares.source_backup
    source_backupdr_backup = each.value.file_shares.source_backupdr_backup
  }

  dynamic "networks" {
    for_each = each.value.networks
    content {
      connect_mode = networks.value.connect_mode
      modes        = networks.value.modes
      network      = networks.value.network
      dynamic "psc_config" {
        for_each = networks.value.psc_config != null ? [networks.value.psc_config] : []
        content {
          endpoint_project = psc_config.value.endpoint_project
        }
      }
      reserved_ip_range = networks.value.reserved_ip_range
    }
  }

  dynamic "directory_services" {
    for_each = each.value.directory_services != null ? [each.value.directory_services] : []
    content {
      dynamic "ldap" {
        for_each = directory_services.value.ldap != null ? [directory_services.value.ldap] : []
        content {
          domain    = ldap.value.domain
          groups_ou = ldap.value.groups_ou
          servers   = ldap.value.servers
          users_ou  = ldap.value.users_ou
        }
      }
    }
  }

  dynamic "initial_replication" {
    for_each = each.value.initial_replication != null ? [each.value.initial_replication] : []
    content {
      dynamic "replicas" {
        for_each = initial_replication.value.replicas != null ? initial_replication.value.replicas : []
        content {
          peer_instance = replicas.value.peer_instance
        }
      }
      role = initial_replication.value.role
    }
  }

  dynamic "performance_config" {
    for_each = each.value.performance_config != null ? [each.value.performance_config] : []
    content {
      dynamic "fixed_iops" {
        for_each = performance_config.value.fixed_iops != null ? [performance_config.value.fixed_iops] : []
        content {
          max_iops = fixed_iops.value.max_iops
        }
      }
      dynamic "iops_per_tb" {
        for_each = performance_config.value.iops_per_tb != null ? [performance_config.value.iops_per_tb] : []
        content {
          max_iops_per_tb = iops_per_tb.value.max_iops_per_tb
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

