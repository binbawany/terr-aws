resource "aws_instance" "iis" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  user_data = file("scripts/install_iis.sh")

  tags = {
    Name = "IIS-Instance"
  }

  provisioner "local-exec" {
    command = "aws ec2 create-launch-configuration --launch-configuration-name my-launch-config --instance-id ${self.id}"
  }

  provisioner "local-exec" {
    when = "destroy"
    command = "aws ec2 terminate-instances --instance-ids ${self.id}"
  }
}
