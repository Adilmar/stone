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

resource "aws_lambda_function" "test_lambda" {
  filename      = "stone_register.zip"
  function_name = "stone_teste2"
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