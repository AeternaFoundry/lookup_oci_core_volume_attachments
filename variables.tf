variable "core_volume_attachments_lookup" {
  description = <<EOT
Map of core_volume_attachments_lookup, attributes below
Required:
    - compartment_id
Optional:
    - availability_domain
    - instance_id
    - volume_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id      = string
    availability_domain = optional(string)
    instance_id         = optional(string)
    volume_id           = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

