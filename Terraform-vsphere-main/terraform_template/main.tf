##Provider

# in the main.tf file ( root ) we only define our provider and the modules we create 
provider "vsphere" {

  user           = var.user
  password       = var.password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}



module "master-node" {
  source   = "./compute"
  instances = var.instances_master
  count = var.instances
  #variables related to vSPhere
  name_dc                = var.name_dc
  name_rp                = var.name_rp
  name_vsphere_datastore = var.name_vsphere_datastore1
  name_vsphere_network   = var.name_vsphere_network
  user                   = var.user
  password               = var.password
  vsphere_server         = var.vsphere_server

  #variables related to the resource
  num_cpus = var.num_cpus_master
  memory   = var.memory_master
  disk-size = var.master-disk
  ip_address = var.ip_address_master
  name = var.name_master

  # ip_address         = var.ip_address
 # ipv4_gateway       = var.ipv4_gateway
  #ipv4_prefix_length = var.ipv4_prefix_length


}

module "worker-node" {
  source   = "./compute"
  instances = var.instances_worker
  count = var.instances
  #variables related to vSPhere
  name_dc                = var.name_dc
  name_rp                = var.name_rp
  name_vsphere_datastore = var.name_vsphere_datastore2
  name_vsphere_network   = var.name_vsphere_network
  user                   = var.user
  password               = var.password
  vsphere_server         = var.vsphere_server

  #variables related to the resource
  num_cpus = var.num_cpus_worker
  disk-size = var.worker-disk
  memory   = var.memory_worker
  ip_address = var.ip_address_worker
  name = var.name_worker

  # ip_address         = var.ip_address
  #ipv4_gateway       = var.ipv4_gateway
  #ipv4_prefix_length = var.ipv4_prefix_length


}

# in the module's call, we must define ALL OF THE VARIABLES that we used inside the module itself ( inside the module folder ) 








module "bastion-node" {
  source   = "./compute"
  instances = var.instances_bastion
  count = var.instances
  #variables related to vSPhere
  name_dc                = var.name_dc
  name_rp                = var.name_rp
  name_vsphere_datastore = var.name_vsphere_datastore3
  name_vsphere_network   = var.name_vsphere_network
  user                   = var.user
  password               = var.password
  vsphere_server         = var.vsphere_server

  #variables related to the resource
  num_cpus = var.num_cpus_bastion
  memory   = var.memory_bastion
  disk-size = var.bastion-disk
  ip_address = var.ip_address_bastion
  name = var.name_bastion

  # ip_address         = var.ip_address
  #ipv4_gateway       = var.ipv4_gateway
  #ipv4_prefix_length = var.ipv4_prefix_length


}



