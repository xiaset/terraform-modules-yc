variable "name" {
  description = "The name of the instance"
  type        = string
}

variable "folder_id" {
  description = "ID of the folder"
  type        = string
}

variable "hostname" {
  description = "Host name for the instance. This field is used to generate the instance fqdn value. The host name must be unique within the network and region. If not specified, the host name will be equal to id of the instance and fqdn will be <id>.auto.internal. Otherwise FQDN will be <hostname>.<region_id>.internal"
  type        = string
  default = null
}

variable "description" {
  description = "The description of the instance"
  type        = string
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the instance"
  type        = map(any)
  default     = { managed-by = "terraform" }
}

variable "ssh_username" {
  description = "SSH username for access to instance"
  type        = string
}

variable "ssh_pub_key" {
  description = "SSH public key for access to instance"
  type        = string
}

variable "zone" {
  description = "The name of the zone"
  type        = string
  default     = "ru-central1-a"
}

variable "platform_id" {
  description = "The ID of the platform"
  type        = string
  default     = "standard-v3"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "private_dns_records" {
  description = "Map of configurations for creating ipv4 private DNS records"
  type        = map(any)
  default     = {}
}

variable "public_dns_records" {
  description = "Map of configurations for creating ipv4 public DNS records"
  type        = map(any)
  default     = {}
}

variable "boot_image_id" {
  description = "Boot disk image ID"
  type        = string
}

variable "boot_disk_size" {
  description = "Boot disk size"
  type        = number
}

variable "boot_disk_type" {
  description = "Boot disk type"
  default     = "network-hdd"
}

variable "cores" {
  description = "The number of CPU cores"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory size in GB"
  type        = number
  default     = 1
}

variable "core_fraction" {
  description = "Baseline performance for a core as a percent"
  type        = number
  default     = 5
}

variable "create_external_ip" {
  description = "To create external ip or not"
  type        = bool
  default     = false
}

variable "create_static_external_ip" {
  description = "To create static external ip or not"
  type        = bool
  default     = false
}

variable "create_secondary_disk" {
  description = "To create secondary disk or not"
  type        = bool
  default     = false
}

variable "secondary_disk_size" {
  description = "Size of the persistent disk, specified in GB"
  type        = number
  default     = 5
}

variable "secondary_disk_type" {
  description = "Type of disk to create"
  type        = string
  default     = "network-hdd"
}

variable "preemptible" {
  description = "Specifies if the instance is preemptible"
  type        = bool
  default     = false
}

variable "allow_stopping_for_update" {
  description = "If true, allows Terraform to stop the instance in order to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "Security group ids for network interface"
  type        = list(any)
  default     = []
}

variable "user_data" {
   description = "The user-data cloud config for the instance"
   type        = string
}
