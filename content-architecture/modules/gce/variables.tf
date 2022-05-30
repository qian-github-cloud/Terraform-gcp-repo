variable "instance_name" {
  description = "value of the instance name"
  type        = string
}

variable "machine_type" {
  description = "value of the machine type"
  type        = string
}

variable "zone" {
  description = "value of the zone"
  type        = string
}

variable "network" {
  description = "value of the network"
  type        = string
}

variable "subnetwork" {
  description = "value of the subnetwork"
  type        = string
}

variable "tags" {
  description = "value of the tags"
  type        = list(string)
}

variable "boot_disk_name" {
  description = "value of the boot disk name"
  type        = string
}

variable "auto_delete" {
  description = "value of the auto delete"
  type        = bool
}

variable "image_name" {
  description = "value of the image name"
  type        = string
}

variable "disk_size" {
  description = "value of the disk size"
  type        = number
}

variable "disk_type" {
  description = "value of the disk type"
  type        = string
}

variable "project_id" {
  description = "value of the project id"
  type        = string
}

variable "subnetwork_project" {
  description = "value of the subnetwork project"
  type        = string
}
