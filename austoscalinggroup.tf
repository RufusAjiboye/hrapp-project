resource "aws_launch_configuration" "hrapp" {

  image_id                    = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  security_groups             = [aws_security_group.myhrapp_sg.id]
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER=ecs_sg >> /etc/ecs/ecs.config"
  associate_public_ip_address = true
}

resource "aws_autoscaling_group" "hrapp_alt" {
  desired_capacity          = 0
  max_size                  = 0
  min_size                  = 0
  name                      = "Myhrapp"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.hrapp.id
  vpc_zone_identifier       = ["${aws_subnet.subnet_public1.id}", "${aws_subnet.subnet_public2.id}"]
  target_group_arns         = [aws_lb_target_group.hrapp_tg.arn]
}

resource "aws_placement_group" "hrapp_placement_group" {
  name     = "test"
  strategy = "cluster"
}

















# resource "aws_placement_group" "hrapp_placement_group" {
#   name     = "hrapp"
#   strategy = "cluster"
# }

# resource "aws_launch_template" "hrapp_alt" {
#   name_prefix            = "app_launch-template"
#   description            = "This will allow launch template"
#   image_id               = var.image_id
#   key_name               = var.ec2_key_name
#   instance_type          = var.ec2_instance_type
#   vpc_security_group_ids = [aws_security_group.hrapp_sg.id]
#   user_data              = "#!/bin/bash\necho ECS_CLUSTER=ecs_sg >> /etc/ecs/ecs.config"
# }

# resource "aws_autoscaling_group" "hrapp-asg" {
#   max_size                  = 3
#   min_size                  = 1
#   desired_capacity          = 1
#   health_check_grace_period = 300
#   health_check_type         = "EC2"
#   force_delete              = true
#   launch_configuration      = aws_placement_group.hrapp_placement_group.name
#   vpc_zone_identifier       = ["${aws_subnet.subnet_public1.id}", "${aws_subnet.subnet_public2.id}"]

#   tag {
#     key                 = "Hrapp_Name"
#     value               = "bar"
#     propagate_at_launch = true
#   }
# }
