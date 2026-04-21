###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  sensitive   = true
}

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  description = "VPC network & subnet name"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}

###image vars

variable "vm_web_family" {
  type        = string
  description = "OS for VM"
}

###instance vars

variable "vm_web_name" {
  type        = string
  description = "name of instance"
}

variable "vm_web_platform" {
  type        = string
  description = "id of platform"
}

#variable "vm_web_cpu" {
#type        = number
#description = "number of cores"
#}

#variable "vm_web_memory" {
#type        = number
#description = "number of ram"
#}

#variable "vm_web_fraction" {
#type        = number
#description = "number of fractions"
#}

###metadata

#variable "vm_web_spe" {
#type        = number
#description = "serial port enable"
#}

#variable "vm_user" {
#type        = string
#description = "user name for VM"
#}

variable "vm_web_role" {
  type = string
}

variable "vm_db_role" {
  type = string
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  description = "Ресурсы для каждой ВМ"
}

variable "vms_metadata" {
  type        = map(string)
  description = "Общие метаданные"
}

# Задание 8

variable "test" {
  type = list(map(list(string)))
}

