variable "instance_template_name" {
  description = "Name of the instance template"
  type        = string
}

variable "machine_type" {
  description = "Name of the machine type"
  type        = string
}

variable "source_image" {
  description = "Name of the source image"
  type        = string
}


variable "network" {
  description = "Name of the network"
  type        = string
}

variable "subnetwork" {
  description = "Name of the subnetwork"
  type        = string
}

variable "instance_group_manager_name" {
  description = "Name of the instance group manager"
  type        = string
}

variable "base_instance_name" {
  description = "Name of the base instance"
  type        = string
}

variable "target_size" {
  description = "Target size of the instance group"
  type        = number
}
variable "zone" {
  description = "Name of the zone"
  type        = string
}

variable "region_autoscaler_name" {
  description = "Name of the region autoscaler"
  type        = string
}

variable "region" {
  description = "Name of the region"
  type        = string
}

variable "max_replicas" {
  description = "Maximum number of replicas"
  type        = number
}

variable "min_replicas" {
  description = "Minimum number of replicas"
  type        = number
}

variable "cooldown_period" {
  description = "Cooldown period"
  type        = number
}


variable "health_check_name" {
  description = "Name of the health check"
  type        = string
}

variable "port" {
  description = "Port"
  type        = number
}
