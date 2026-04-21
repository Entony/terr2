resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  #Добавляем таблицу маршрутизации согласно заданию 9
  route_table_id = yandex_vpc_route_table.rt.id
}

# Подсеть для db

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}_db"
  zone           = var.db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_cidr
  #Добавляем таблицу маршрутизации согласно заданию 9
  route_table_id = yandex_vpc_route_table.rt.id
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform

  resources {

    #cores         = var.vm_web_cpu
    #memory        = var.vm_web_memory
    #core_fraction = var.vm_web_fraction

    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }

  #metadata = {
  #serial-port-enable = var.vm_web_spe
  #ssh-keys           = "${var.vm_user}:${var.vms_ssh_root_key}"
  #}

  metadata = var.vms_metadata

}

# Вторая ВМ

resource "yandex_compute_instance" "platform_db" {
  name        = var.vm_db_name
  zone        = var.db_zone
  platform_id = var.vm_db_platform
  resources {
    #cores         = var.vm_db_cpu
    #memory        = var.vm_db_memory
    #core_fraction = var.vm_db_fraction

    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction

  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = false
  }

  #metadata = {
  #serial-port-enable = var.vm_db_spe
  #ssh-keys           = "${var.vm_user}:${var.vms_ssh_root_key}"
  #}

  metadata = var.vms_metadata

}
