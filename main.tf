resource "aws_iam_policy" "policy" {
  name        = var.name
  name_prefix = var.name_prefix
  description = var.description
  path        = var.path

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ${jsonencode([for action in var.actions: "dynamodb:${action}"])},
      "Resource": "${var.db_arn}"
    }
  ]
}
EOF
}