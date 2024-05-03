output "dns_zone_id" {
  value       = yandex_dns_zone.this.id
  description = "ID of the created DNS zone."
}

output "dns_zone_creation_timestamp" {
  value       = yandex_dns_zone.this.created_at
  description = "The DNS zone creation timestamp."
}

