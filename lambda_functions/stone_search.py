import base64 
import json
import random
from botocore.vendored import requests
from boto3.dynamodb.conditions import Attr
import os
import boto3
import uuid


def lambda_handler(event, context):
    data = event
    print("dados: ",data)


    #capturando dados 
    if(data.get("nome")):
        user=str(event["nome"])
        print("user",user)
        dynamodb = boto3.resource("dynamodb")
        table = dynamodb.Table(os.environ["DB_TABLE_NAME"])

        # Return the existing record for the same text, voice, platform and options
        # if this record exists
        existing_fun = table.scan(
            FilterExpression = Attr("nome").eq(user)
        )
            
        if existing_fun["Count"] > 0:
            id    = existing_fun["Items"][0]["id"]
            nome  = existing_fun["Items"][0]["nome"]
            idade = existing_fun["Items"][0]["idade"]
            cargo = existing_fun["Items"][0]["cargo"]
          


        return{
            'statusCode':200,
            'message':"Funcionario encontrado!",
            'id':id,
            'nome':nome,
            'idade':idade,
            'cargo':cargo
        }
        

    else:
        return{
            'statusCode': 400,
            'message': "Atributos faltando, obrigatorio (nome)"
        }
    