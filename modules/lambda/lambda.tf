resource "aws_lambda_function" "lambda_function" {
  filename         = "lambda_function.zip"
  function_name    = "lambda_function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime          = "python3.8"

}
output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn

}
output "lambda_function_intergation" {
  value = aws_lambda_function.lambda_function.arn

}
