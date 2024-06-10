
#------------variables related to vSphere
user                   = "administrator@vsphere.local"
password               = "indp3AIMAIM..."
vsphere_server         = "192.168.101.166"
name_rp                = "K8s"
name_dc                = "Datacenter-OCCNE"
name_vsphere_datastore1 ="DISK E"
name_vsphere_datastore2 = "DISK E"
name_vsphere_datastore3 = "DISK E"

name_vsphere_network   = "ETH_MIRROR"



#----------variables related to MASTER NODE module 
ipv4_gateway       = "192.168.102.1"
ipv4_prefix_length = "24"


#---------------variables related to cloud-init
ip_address_master = ["192.168.102.28", "192.168.102.29", "192.168.102.30"]
name_master       = "master"
num_cpus_master   = 4
memory_master     = 6144
instances_master   = 3

ip_address_worker = ["192.168.102.31", "192.168.102.32", "192.168.102.33", "192.168.102.34", "192.168.102.35", "192.168.102.36"]
name_worker      = "worker"
num_cpus_worker   = 4
memory_worker     = 8192
instances_worker   = 6
ip_address_bastion = ["192.168.102.37"]
name_bastion      = "bastion"
num_cpus_bastion   = 4
memory_bastion     = 6144
instances_bastion   = 1

worker-disk= 50
master-disk=40
bastion-disk=70 
