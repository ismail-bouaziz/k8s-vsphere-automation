
resource "local_file" "pet" {
  filename        = "/home/Ismail-Bouaziz/Documents/k8s-vsphere-automation/terraform/${random_pet.petname.id}.txt"
  content         = "We love pets!"
  file_permission = "700"
}
resource "random_pet" "petname" { 
   length = 1
}
