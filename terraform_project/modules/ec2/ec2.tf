
# create-instance.tf
resource "aws_key_pair" "jitsi" {
    key_name = "jitsi"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}

resource "aws_instance" "instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = "${var.aws_region}${var.aws_region_az_01}"
  key_name                    = "${aws_key_pair.jitsi.key_name}"
  
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  //  userdata  after provisioning

   connection {
    type  = "ssh"
    host  = self.public_ip
    user  = var.ssh_user
    port  = var.ssh_port
    
    private_key = file(var.PRIVATE_KEY_PATH)
  }
   provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
        
    }
    provisioner "file" {
        source = "src"
        destination = "/home/ubuntu/"
        
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh"
        ]
    }
/// userdata after provisioning

# count                       = var.instance_count
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-instance"
    "KeepInstanceRunning" = "false"
  }
}