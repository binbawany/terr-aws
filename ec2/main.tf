resource "aws_instance" "iis" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.ec2_sg_id]
  user_data = file("${path.module}/script.tpl")

  tags = {
    Name = "IIS-Instance"
  }

  # provisioner "local-exec" {
  #   command = "aws ec2 create-launch-configuration --launch-configuration-name my-launch-config --instance-id ${self.id}"
  # }

  # provisioner "local-exec" {
  #   when = "destroy"
  #   command = "aws ec2 terminate-instances --instance-ids ${self.id}"
  # }
}
