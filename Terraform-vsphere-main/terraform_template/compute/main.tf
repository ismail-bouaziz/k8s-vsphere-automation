
# data templates must be declared here 

data "vsphere_datacenter" "dc" {
  name = var.name_dc
}

# If you don't have any resource pools, put "/Resources" after cluster name
data "vsphere_resource_pool" "pool" {
  name          = var.name_rp
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve datastore information on vsphere
data "vsphere_datastore" "datastore" {
  name          = var.name_vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve network information on vsphere
data "vsphere_network" "network" {
  name          = var.name_vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template" {
  name          = "vmahmed"
  datacenter_id = data.vsphere_datacenter.dc.id
}


# Set vm parameters
resource "vsphere_virtual_machine" "demo" {

  count = var.instances
  
  name = "${var.name}-${count.index + 1}-pfe" 
  num_cpus         = var.num_cpus 
  memory           = var.memory

  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  

  wait_for_guest_net_timeout = -1
  wait_for_guest_ip_timeout  = -1

  network_interface {
    network_id = data.vsphere_network.network.id

  }

  disk {
    label            = "diskA"
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    size             = var.disk-size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id


}
 # we use extra_config for cloud_init 
 extra_config = {
    
    "guestinfo.metadata"          = base64encode(data.template_file.metadataconfig[count.index].rendered)
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(file("../Scripts/userdata.yaml"))
    "guestinfo.userdata.encoding" = "base64"
  }

  }








