variable "router_name" {
  description = "value of router_name"
  type        = string
}

variable "region" {
  description = "value of region"
  type        = string
}

variable "network" {
  description = "value of network"
  type        = string

}


variable "router_nat_name" {
  description = "value of router_nat_name"
  type        = string
}


variable "nat_ip_allocate_option" {
  description = "value of nat_ip_allocate_option"
  type        = string
}


variable "source_subnetwork_ip_ranges_to_nat" {
  description = "value of source_subnetwork_ip_ranges_to_nat"
  type        = string
}
