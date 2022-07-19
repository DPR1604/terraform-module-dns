variable "zones" {
  type = map(object({
    zone             = string
    dns              = string
    ssl              = string
    always_use_https = string
    min_tls_version  = string
    plan             = string
    data_records = map(object({
      name = string
      data = object({
        service  = string
        proto    = string
        name     = string
        priority = number
        weight   = number
        port     = number
        target   = string
      })
      type     = string
      proxied  = bool
      priority = number
    }))
    value_records = map(object({
      name     = string
      value    = string
      type     = string
      proxied  = bool
      priority = number
    }))
  }))
}