provider "aws" {
  region = var.region
}

resource "aws_iam_role" "iam_lambda" {
  name = "iam_lambda"
  assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
		"Action": "sts:AssumeRole",
		"Principal": { "Service": "lambda.amazonaws.com" },
		"Effect": "Allow",
		"Sid": "" } ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role = "${aws_iam_role.iam_lambda.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "greet_lambda" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "var.lambda_location"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "var.lambda_location"
  function_name = "greet_lambda"
  role          = "${aws_iam_role.iam_lambda.arn}"
  handler       = "greet_lambda.lambda_handler"

  runtime = "python3.7"
  environment {
    variables = {
      greeting = "Hello!"
    }
  }
}
