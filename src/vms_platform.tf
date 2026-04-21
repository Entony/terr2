
# новая подсеть для db

variable "db_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "db_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###image vars

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS for VM"
}

###instance vars

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name of instance"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v2"
  description = "id of platform"
}

variable "vm_db_cpu" {
  type        = number
  default     = 2
  description = "number of cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "number of ram"
}

variable "vm_db_fraction" {
  type        = number
  default     = 20
  description = "number of fractions"
}

###metadata

variable "vm_db_spe" {
  type        = number
  default     = 1
  description = "serial port enable"
}


