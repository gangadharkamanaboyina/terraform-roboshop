module "bastion" {
  source            = "github.com/gangadharkamanaboyina/terraform-module-ec2.git?ref=main"
  ami_id            = local.ami_id
  instance_type     = local.instance_type
  sg_ids            = [local.sg_id]
  project           = var.project
  env               = var.env
  name              = var.name
  tags              = var.tags
  subnet_id = local.public_subnet_ids[0]

#     provisioner "remote-exec" {
#     inline = [
#       "sudo mkfs -t xfs /dev/nvme1n1 || true",
#       "sudo mkdir -p /data",
#       "sudo mount /dev/nvme1n1 /data",
#       "UUID=$(sudo blkid -s UUID -o value /dev/nvme1n1)",
#       "echo \"UUID=$UUID /data xfs defaults,nofail 0 2\" | sudo tee -a /etc/fstab"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       password = "DevOps321"
#       host        = self.public_ip
#     }
#   }
 }

resource "aws_ebs_volume" "bastion_data_volume" {
  availability_zone = module.bastion.availability_zone
  size              = 30
  type              = "gp3"

  tags = merge(var.tags, {
    Name = "${local.common_name}-bastion-data"
  })
}

resource "aws_volume_attachment" "bastion_data_attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.bastion_data_volume.id
  instance_id = module.bastion.instance_id
}
