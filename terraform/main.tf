resource "local_file" "pet"{
    filename = "/home/Ismail-Bouaziz/Documents/k8s-vsphere-automation/terraform/pets.txt"
    content = "We love pets!"
    file_permission = "700"
}