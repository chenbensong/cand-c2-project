# TODO: Define the output variable for the lambda function.
output "role_arn" {
  description = "Output Lambda's role ARN."
  value       = "${aws_iam_role.iam_lambda.arn}"
}
