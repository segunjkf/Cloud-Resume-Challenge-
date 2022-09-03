resource "aws_apigatewayv2_api" "lambda-api" {
  name          = "lambda-http-api"
  protocol_type = "HTTP"
  target        = var.lambda-arn
  cors_configuration {
    allow_origins = ["*"]
  }
}

resource "aws_apigatewayv2_integration" "api-intergation" {
  api_id           = aws_apigatewayv2_api.lambda-api.id
  integration_type = "AWS_PROXY"

  integration_method   = "GET"
  integration_uri      = var.intergation-url
  passthrough_behavior = "WHEN_NO_MATCH"
}
resource "aws_lambda_permission" "apigw" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda-arn2
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.lambda-api.execution_arn}/*/*"
}
