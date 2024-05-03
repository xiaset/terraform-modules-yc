variable "folder_id" {
  type        = string
  description = "ID of the folder to create a zone in. If not provided, the default provider folder is used."
  default     = null
}

variable "zone_name" {
  type        = string
  description = "The DNS name of this zone, e.g., 'example.com.' Must end with a dot."
}

variable "name" {
  type        = string
  description = "User assigned name of the DNS zone."
  default     = null
}

variable "description" {
  type        = string
  description = "Description of the DNS zone."
  default     = null
}

variable "labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the DNS zone."
  default     = {}
}

variable "public" {
  type        = bool
  description = "Visibility of the zone. True for public, false for private."
  default     = true
}

variable "private_networks" {
  type        = list(string)
  description = "For privately visible zones, the set of Virtual Private Cloud resources that the zone is visible from."
  default     = []
}

variable "deletion_protection" {
  type        = bool
  description = "Flag that protects the DNS zone from accidental deletion."
  default     = false
}

