variable "firewall_name" {
  description = "Name of the firewall"
  type        = string
}

variable "network" {
  description = "Name of the network"
  type        = string
}

variable "port" {
  description = "Name of the source range"
  type        = number
}

variable "source_ranges" {
  description = "Name of the source range"
  type        = list(string)
}

variable "target_tags" {
  description = "value of the target tags"
  type        = list(string)
}
