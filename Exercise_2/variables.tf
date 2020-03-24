# TODO: Define the variable for aws_region
variable "region" {
  default = "us-east-1"
}

# Lambda location
variable "lambda_location" {
  type    = list(string)
  default = ["outputs/greet_lambda.zip"]
}
