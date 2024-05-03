resource "yandex_dns_zone" "this" {
  name                 = var.name
  description          = var.description
  labels               = var.labels
  zone                 = var.zone_name
  public               = var.public
  private_networks     = var.private_networks
  deletion_protection  = var.deletion_protection
  folder_id            = var.folder_id
}

