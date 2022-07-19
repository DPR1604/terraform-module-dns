locals {
  value_records = flatten([
    for zone_key, zone in var.zones : [
      for record_key, record in zone.value_records : {
        zone_key     = zone_key
        record_key   = record_key
        dns_value    = record.value
        dns_name     = record.name
        dns_type     = record.type
        dns_proxied  = record.proxied
        dns_priority = record.priority
      }
    ]
  ])
}

locals {
  data_records = flatten([
    for zone_key, zone in var.zones : [
      for record_key, record in zone.data_records : {
        zone_key          = zone_key
        record_key        = record_key
        dns_name          = record.name
        dns_type          = record.type
        dns_proxied       = record.proxied
        dns_priority      = record.priority
        dns_data_service  = record.data.service
        dns_data_proto    = record.data.proto
        dns_data_name     = record.data.name
        dns_data_priority = record.data.priority
        dns_data_weight   = record.data.weight
        dns_data_port     = record.data.port
        dns_data_target   = record.data.target
      }
    ]
  ])
}

locals {
  all_page_rules = flatten([
    for zone_key, zone in var.zones : [
      for page_rule_key, page_rule in zone.page_rules : {
        zone_key              = zone_key
        page_rule_key         = page_rule_key
        page_rule_target      = page_rule.target
        page_rule_forward_url = page_rule.forward_url
        page_rule_status_code = page_rule.status_code
        page_rule_priority    = page_rule.priority
      }
    ]
  ])
}
