resource "aws_ecs_cluster" "ecs_cluster" {
  name = "container-demo"
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}