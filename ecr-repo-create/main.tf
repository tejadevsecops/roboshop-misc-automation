resource "aws_ecr_repository" "ecr" {
  count                = length(var.ecr)
  name                 = "roboshop-${var.ecr[count.index]}"
  image_tag_mutability = "MUTABLE"
}