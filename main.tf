data "oci_core_volume_attachments" "core_volume_attachments_lookup" {
  for_each = var.core_volume_attachments_lookup

  compartment_id      = each.value.compartment_id
  availability_domain = each.value.availability_domain
  instance_id         = each.value.instance_id
  volume_id           = each.value.volume_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

