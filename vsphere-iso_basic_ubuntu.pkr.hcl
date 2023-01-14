source "vsphere-iso" "this" {
  vcenter_server    = var.vsphere_server
  username          = var.vsphere_user
  password          = var.vsphere_password
  datacenter        = ""
  cluster           = var.cluster
  insecure_connection  = true

  vm_name = var.vm_name
  guest_os_type = "ubuntu64Guest"

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = "20m"

  CPUs =             var.vm_cpus
  RAM =              var.vm_ram
  RAM_reserve_all = true

  disk_controller_type =  ["pvscsi"]
  datastore = var.datastore
  storage {
    disk_size =        var.vm_disk_size
    disk_thin_provisioned = true
  }

  iso_paths = ["[datastore1] ${var.iso_path}"]

  network_adapters {
    network =  var.network_name
    network_card = "vmxnet3"
  }

  boot_command = [
    "<enter>",
    //select your language
    "<wait50s><enter>",
    //installer update available --> continue without updating
    "<wait5s><enter>",
    //choose keyboard layout --> EN (US)
    "<wait5s><enter>",
    //choose type of install --> Ubuntu server
    "<wait5s><enter>",
    //network connecitons
    "<wait5s><enter>",
    //configure proxy
    "<wait5s><enter>",
    //conf mirror
    "<wait5s><enter>",
    //guided storage configuration --> use entire disk
    "<wait5s><down><down><down><down><down><enter>",
    //storage configuration
    "<wait5s><enter>",
    //confim destruction action --> Yes
    "<wait5s><down><enter>",
    //profile setup
    "<wait5s><down>${var.host_name}<down>vagrant<down>vagrant<down>vagrant<down><enter>",
    //ssh setup --> install OpenSSH server
    "<wait5s><spacebar><down><down><enter>",
    //Third party drivers
    "<wait5s><enter>",
    //featured server snaps --> skip list and Done
    "<wait5s><end><down><enter>",
    //reboot system
    "<wait4m><down><down><enter>",
    //confirm error unmounting disk
    "<wait6m><enter>",
  ]
}

build {
  sources  = [
    "source.vsphere-iso.this"
  ]
}
