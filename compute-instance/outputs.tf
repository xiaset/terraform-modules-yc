output "instance" {
  description = "Instance object"
  value       = yandex_compute_instance.this
}

output "private_dns_records" {
  description = "Private DNS records"
  value       = yandex_dns_recordset.private
}

output "public_dns_records" {
  description = "Public DNS records"
  value       = yandex_dns_recordset.public
}

#output "instance_internal_ip" {
#  description = "The internal IP address of the instance"
#  value       = yandex_compute_instance.this.network_interface.0.ip_address
#}

#output "instance_external_ip" {
#  description = "The external IP address of the instance"
#  value       = yandex_compute_instance.this.network_interface.0.nat_ip_address
#}

#output "instance_status" {
#  description = "The status of this instance"
#  value       = yandex_compute_instance.this
#}

#output "vpc_external_ip" {
#  description = "External IP address"
#  value       = yandex_vpc_address.this
#}
