variable "user" {}
variable "password" {}
variable "vsphere_server" {}
variable "name_dc" {}
variable "name_rp" {}
variable "name_vsphere_datastore1" {}
variable "name_vsphere_datastore2" {}
variable "name_vsphere_datastore3" {}
variable "bastion-disk" {}
variable "worker-disk" {}
variable "master-disk" {}
variable "instances_bastion" {}
variable "name_vsphere_network" {}



# -----------------Module master-node variables-------------

variable "num_cpus_master" {}
variable "memory_master" {}
variable "ipv4_prefix_length" {}
variable "ipv4_gateway" {}
variable "name_master" {}
variable "ip_address_master" {
  type = list(string)
}


variable "num_cpus_worker" {}
variable "memory_worker" {}
variable "name_worker" {}
variable "ip_address_worker" {
  type = list(string)
}



variable "num_cpus_bastion" {}
variable "memory_bastion" {}
variable "name_bastion" {}
variable "ip_address_bastion" {
  type = list(string)
}



# ----------------- CLOUD INIT VARIABLES------------------------------------


variable "netmask" {
  type    = string
  default = "24"
}

 


variable "instances" {
  default = 1

}

variable "instances_master" {
  default = 1

}


variable "instances_worker" {
  default = 1

}
