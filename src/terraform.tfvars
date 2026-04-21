# cloud

cloud_id     = "b1gv77uktf2hqo7ed2mc"
folder_id    = "b1gkg6dahs4fcqkhecdl"
default_zone = "ru-central1-a"
default_cidr = ["10.0.1.0/24"]
db_zone      = "ru-central1-b"
db_cidr      = ["10.0.2.0/24"]
vpc_name     = "develop"

# ssh

vms_ssh_root_key = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf6mYU6+KXfSoxzl7JEHb4ffE2zd0Xk3fcpuvwV2F+QNaQqT8R6rUS4qDtNjc6WrJY+ubxjv1W5F+gKENJ7Dg4AxMrHNXDqT8lc9qzsrdnAQ416eNIHgr11KFWeWN4fffoBAsrs6g8L5UfU+vvSbPe0cLDfNJAI/bY1M4ePc8QBKpgXqn+M2lr2Uut+FKLqo8pqNX+lHunPl4vPgj0LURrXSE/BCQkmzT03aTbbh4D0zmHo2DRIf25W0HFBqFk01SUPSsFGUpoVmJJxOCuPpjek+Y2nQGoVTUztz4SbNh96B5gJAmw0yDgifHW82WuBj/m4+mng4MvtNpVSdMCoMyP"

# image
vm_web_family = "ubuntu-2004-lts"

#instance

vm_web_name     = "netology-develop-platform-web"
vm_web_platform = "standard-v2"
#vm_web_cpu      = 2
#vm_web_memory   = 1
#vm_web_fraction = 5

#metadata

#vm_web_spe  = 1
#vm_user = "ubuntu"

#other

vm_web_role = "web"
vm_db_role  = "db"

#map

vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

vms_metadata = {
  serial-port-enable = "1"
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf6mYU6+KXfSoxzl7JEHb4ffE2zd0Xk3fcpuvwV2F+QNaQqT8R6rUS4qDtNjc6WrJY+ubxjv1W5F+gKENJ7Dg4AxMrHNXDqT8lc9qzsrdnAQ416eNIHgr11KFWeWN4fffoBAsrs6g8L5UfU+vvSbPe0cLDfNJAI/bY1M4ePc8QBKpgXqn+M2lr2Uut+FKLqo8pqNX+lHunPl4vPgj0LURrXSE/BCQkmzT03aTbbh4D0zmHo2DRIf25W0HFBqFk01SUPSsFGUpoVmJJxOCuPpjek+Y2nQGoVTUztz4SbNh96B5gJAmw0yDgifHW82WuBj/m4+mng4MvtNpVSdMCoMyP"
}


test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
