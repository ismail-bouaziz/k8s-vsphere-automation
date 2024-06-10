data template_file "metadataconfig" {
  count = var.instances
  
  # Main cloud-config configuration file.
  template = file("../Scripts/metadata.yaml")
  vars = {
    ip_address = "${var.ip_address[count.index]}"
    
  }
}

