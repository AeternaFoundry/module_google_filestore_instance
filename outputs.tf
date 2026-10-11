output "filestore_instances_id" {
  description = "Map of id values across all filestore_instances, keyed the same as var.filestore_instances except keys with no id are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "filestore_instances_create_time" {
  description = "Map of create_time values across all filestore_instances, keyed the same as var.filestore_instances except keys with no create_time are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "filestore_instances_deletion_policy" {
  description = "Map of deletion_policy values across all filestore_instances, keyed the same as var.filestore_instances except keys with no deletion_policy are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "filestore_instances_deletion_protection_enabled" {
  description = "Map of deletion_protection_enabled values across all filestore_instances, keyed the same as var.filestore_instances except keys with no deletion_protection_enabled are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.deletion_protection_enabled if v.deletion_protection_enabled != null }
}
output "filestore_instances_deletion_protection_reason" {
  description = "Map of deletion_protection_reason values across all filestore_instances, keyed the same as var.filestore_instances except keys with no deletion_protection_reason are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.deletion_protection_reason if v.deletion_protection_reason != null && length(v.deletion_protection_reason) > 0 }
}
output "filestore_instances_description" {
  description = "Map of description values across all filestore_instances, keyed the same as var.filestore_instances except keys with no description are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.description if v.description != null && length(v.description) > 0 }
}
output "filestore_instances_desired_replica_state" {
  description = "Map of desired_replica_state values across all filestore_instances, keyed the same as var.filestore_instances except keys with no desired_replica_state are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.desired_replica_state if v.desired_replica_state != null && length(v.desired_replica_state) > 0 }
}
output "filestore_instances_directory_services" {
  description = "Map of directory_services values across all filestore_instances, keyed the same as var.filestore_instances except keys with no directory_services are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => one(v.directory_services) if v.directory_services != null && length(v.directory_services) > 0 }
}
output "filestore_instances_effective_labels" {
  description = "Map of effective_labels values across all filestore_instances, keyed the same as var.filestore_instances except keys with no effective_labels are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "filestore_instances_effective_replication" {
  description = "Map of effective_replication values across all filestore_instances, keyed the same as var.filestore_instances except keys with no effective_replication are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.effective_replication if v.effective_replication != null && length(v.effective_replication) > 0 }
}
output "filestore_instances_etag" {
  description = "Map of etag values across all filestore_instances, keyed the same as var.filestore_instances except keys with no etag are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "filestore_instances_file_shares" {
  description = "Map of file_shares values across all filestore_instances, keyed the same as var.filestore_instances except keys with no file_shares are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => one(v.file_shares) if v.file_shares != null && length(v.file_shares) > 0 }
}
output "filestore_instances_initial_replication" {
  description = "Map of initial_replication values across all filestore_instances, keyed the same as var.filestore_instances except keys with no initial_replication are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => one(v.initial_replication) if v.initial_replication != null && length(v.initial_replication) > 0 }
}
output "filestore_instances_kms_key_name" {
  description = "Map of kms_key_name values across all filestore_instances, keyed the same as var.filestore_instances except keys with no kms_key_name are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.kms_key_name if v.kms_key_name != null && length(v.kms_key_name) > 0 }
}
output "filestore_instances_labels" {
  description = "Map of labels values across all filestore_instances, keyed the same as var.filestore_instances except keys with no labels are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "filestore_instances_location" {
  description = "Map of location values across all filestore_instances, keyed the same as var.filestore_instances except keys with no location are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.location if v.location != null && length(v.location) > 0 }
}
output "filestore_instances_name" {
  description = "Map of name values across all filestore_instances, keyed the same as var.filestore_instances except keys with no name are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.name if v.name != null && length(v.name) > 0 }
}
output "filestore_instances_networks" {
  description = "Map of networks values across all filestore_instances, keyed the same as var.filestore_instances except keys with no networks are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.networks if v.networks != null && length(v.networks) > 0 }
}
output "filestore_instances_performance_config" {
  description = "Map of performance_config values across all filestore_instances, keyed the same as var.filestore_instances except keys with no performance_config are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => one(v.performance_config) if v.performance_config != null && length(v.performance_config) > 0 }
}
output "filestore_instances_project" {
  description = "Map of project values across all filestore_instances, keyed the same as var.filestore_instances except keys with no project are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.project if v.project != null && length(v.project) > 0 }
}
output "filestore_instances_protocol" {
  description = "Map of protocol values across all filestore_instances, keyed the same as var.filestore_instances except keys with no protocol are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.protocol if v.protocol != null && length(v.protocol) > 0 }
}
output "filestore_instances_tags" {
  description = "Map of tags values across all filestore_instances, keyed the same as var.filestore_instances except keys with no tags are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "filestore_instances_terraform_labels" {
  description = "Map of terraform_labels values across all filestore_instances, keyed the same as var.filestore_instances except keys with no terraform_labels are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "filestore_instances_tier" {
  description = "Map of tier values across all filestore_instances, keyed the same as var.filestore_instances except keys with no tier are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.tier if v.tier != null && length(v.tier) > 0 }
}
output "filestore_instances_zone" {
  description = "Map of zone values across all filestore_instances, keyed the same as var.filestore_instances except keys with no zone are omitted"
  value       = { for k, v in google_filestore_instance.filestore_instances : k => v.zone if v.zone != null && length(v.zone) > 0 }
}

