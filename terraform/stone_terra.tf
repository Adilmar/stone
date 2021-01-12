provider "aws" {
	access_key = ""
	secret_key = ""
	region = "us-east-2"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "stone-test"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "dev"
  }
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.role_for_LDC.id

  policy = file("policy.json")
}


resource "aws_iam_role" "role_for_LDC" {
  name = "myrole"
  
  assume_role_policy = file("assume_role_policy.json")

}

resource "aws_lambda_function" "stone_register2" {
  filename      = "stone_register.zip"
  function_name = "stone_register3"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "stone_register.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("stone_register.zip"))}"
  source_code_hash = filebase64sha256("stone_register.zip")

  runtime = "python3.6"

  environment {
    variables = {
      DB_TABLE_NAME = "stone-test"
    }
  }
}



resource "aws_lambda_function" "stone_delete2" {
  filename      = "stone_delete.zip"
  function_name = "stone_delete3"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "stone_delete.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("stone_delete.zip"))}"
  source_code_hash = filebase64sha256("stone_delete.zip")

  runtime = "python3.6"

  environment {
    variables = {
      DB_TABLE_NAME = "stone-test"
    }
  }
}


resource "aws_lambda_function" "stone_search2" {
  filename      = "stone_search.zip"
  function_name = "stone_search3"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "stone_search.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("stone_search.zip"))}"
  source_code_hash = filebase64sha256("stone_search.zip")

  runtime = "python3.6"

  environment {
    variables = {
      DB_TABLE_NAME = "stone-test"
    }
  }
}

resource "aws_lambda_function" "stone2" {
  filename      = "bot.zip"
  function_name = "stone3"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "bot.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("bot.zip"))}"
  source_code_hash = filebase64sha256("bot.zip")

  runtime = "python3.6"

  environment {
    variables = {
      DB_TABLE_NAME = "stone-test"
    }
  }
}

resource "aws_api_gateway_rest_api" "apiLambda" {
  name        = "myAPI"

}


  resource "aws_api_gateway_resource" "Resource" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "bot"

}

resource "aws_api_gateway_method" "Method" {
   rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
   resource_id   = aws_api_gateway_resource.Resource.id
   http_method   = "POST"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambdaInt" {
   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
   resource_id = aws_api_gateway_resource.Resource.id
   http_method = aws_api_gateway_method.Method.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.stone2.invoke_arn
   
}

  resource "aws_api_gateway_resource" "Resource2" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "register"

}

resource "aws_api_gateway_method" "Method2" {
   rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
   resource_id   = aws_api_gateway_resource.Resource2.id
   http_method   = "POST"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambdaInt2" {
   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
   resource_id = aws_api_gateway_resource.Resource2.id
   http_method = aws_api_gateway_method.Method2.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.stone_register2.invoke_arn
   
}

resource "aws_api_gateway_resource" "Resource3" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "delete"

}

resource "aws_api_gateway_method" "Method3" {
   rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
   resource_id   = aws_api_gateway_resource.Resource3.id
   http_method   = "POST"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambdaInt3" {
   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
   resource_id = aws_api_gateway_resource.Resource3.id
   http_method = aws_api_gateway_method.Method3.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.stone_delete2.invoke_arn
   
}

resource "aws_api_gateway_resource" "Resource4" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "search"

}

resource "aws_api_gateway_method" "Method4" {
   rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
   resource_id   = aws_api_gateway_resource.Resource4.id
   http_method   = "POST"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambdaInt4" {
   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
   resource_id = aws_api_gateway_resource.Resource4.id
   http_method = aws_api_gateway_method.Method4.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.stone_search2.invoke_arn
   
}


resource "aws_api_gateway_deployment" "apideploy" {
   depends_on = [aws_api_gateway_integration.lambdaInt]

   rest_api_id = aws_api_gateway_rest_api.apiLambda.id
   stage_name  = "Prod"
}


resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowExecutionFromAPIGateway"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.stone2.function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/Prod/POST/bot"

}

resource "aws_lambda_permission" "apigw2" {
   statement_id  = "AllowExecutionFromAPIGateway"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.stone_register2.function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/Prod/POST/register"

}

  


resource "aws_lambda_permission" "apigw3" {
   statement_id  = "AllowExecutionFromAPIGateway"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.stone_delete2.function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/Prod/POST/delete"

}


resource "aws_lambda_permission" "apigw4" {
   statement_id  = "AllowExecutionFromAPIGateway"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.stone_search2.function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/Prod/POST/search"

}

 


output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}
