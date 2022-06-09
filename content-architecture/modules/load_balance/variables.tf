variable "backend_service_name" {
  description = "Name of the backend service"
  type        = string
}

variable "instance_group_manager_name" {
  description = "Name of the instance group manager"
  type        = string
}

variable "health_check_name" {
  description = "Name of the health check"
  type        = list(string)
}

variable "url_map_name" {
  description = "Name of the url map"
  type        = string
}



variable "https_proxy_name" {
  description = "Name of the https proxy"
  type        = string
}

variable "forwarding_rule_name" {
  description = "Name of the forwarding rule"
  type        = string
}

variable "port_range" {
  description = "Port range"
  type        = string
}

variable "certificate_name" {
  description = "Name of the certificate"
  type        = string
}


variable "dns_names" {
  description = "DNS names"
  type        = list(string)
}

variable "common_name" {
  description = "Common name"
  type        = string
}

