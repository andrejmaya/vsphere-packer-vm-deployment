variable "vsphere_server" {
  type    = string
  default = ""
}

variable "vsphere_user" {
  type    = string
  default = ""
}

variable "vsphere_password" {
  type    = string
  default = ""
}

variable "cluster" {
  type    = string
  default = ""
}

variable "datastore" {
  type    = string
  default = ""
}

variable "network_name" {
  type    = string
  default = ""
}

variable "vm_name" {
  type = string
  default = ""
}

variable "host_name" {
  type = string
  default = ""
}

variable "vm_cpus" {
  type = number
  default = 1
}

variable "vm_ram" {
  type = number
  default = 1024
}

variable "vm_disk_size" {
  type = number
  default = 6144
}

variable "ssh_username" {
  type = string
  default = ""
}

variable "ssh_password" {
  type = string
  default = ""
}

variable "iso_path" {
  type = string
  default = ""
}