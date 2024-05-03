resource "yandex_compute_instance" "this" {
  name        = var.name
  description = var.description
  zone        = var.zone
  hostname    = var.hostname
  folder_id   = var.folder_id

  platform_id = var.platform_id

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_image_id
      size     = var.boot_disk_size
      type     = var.boot_disk_type
      name     = "${var.name}-boot"
    }
  }

  dynamic "secondary_disk" {
    for_each = var.create_secondary_disk ? { secondary_disk = "" } : {}
    content {
      disk_id = yandex_compute_disk.this["secondary_disk"].id
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.external_ip
    nat_ip_address     = var.static_external_ip ? yandex_vpc_address.this["external_ip"].external_ipv4_address[0].address : ""
    security_group_ids = var.security_group_ids
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  allow_stopping_for_update = var.allow_stopping_for_update

  metadata = {
    foo      = "bar"
    ssh-keys = "${var.ssh_admin_username}:${var.ssh_admin_pub_key}"
  }

  labels = merge({
    name = var.name
    },
    var.labels
  )
}

resource "yandex_compute_disk" "this" {
  for_each = var.create_secondary_disk ? { secondary_disk = "" } : {}

  size = var.secondary_disk_size
  type = var.secondary_disk_type
  zone = var.zone
  name = "${var.name}-secondary"
}

resource "yandex_vpc_address" "this" {
  for_each = var.static_external_ip ? { external_ip = "" } : {}
  name     = var.name

  external_ipv4_address {
    zone_id = var.zone
  }
}

resource "yandex_dns_recordset" "public" {
  for_each = var.public_dns_records
  zone_id  = each.value["zone_id"]
  name     = each.value["name"]
  type     = each.value["type"]
  ttl      = lookup(each.value, "ttl", 300)
  data     = var.static_external_ip ? [yandex_vpc_address.this.address] : [yandex_compute_instance.this.network_interface[0].nat_ip_address]
}

resource "yandex_dns_recordset" "private" {
  for_each = var.private_dns_records
  zone_id  = each.value["zone_id"]
  name     = each.value["name"]
  type     = each.value["type"]
  ttl      = lookup(each.value, "ttl", 300)
  data     = [yandex_compute_instance.this.network_interface[0].ip_address]
}
