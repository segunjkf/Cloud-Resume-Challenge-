/*locals {
    lambda_zip_location = "/lambda_function.zip"
}

data "archive_file" "registercount" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "${local.lambda_zip_location}"
}*/

resource "aws_lambda_function" "lambda_function" {
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime = "python3.8"

}