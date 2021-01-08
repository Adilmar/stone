import base64 
import json
import random
from botocore.vendored import requests
import os
import boto3
import uuid



def lambda_handler(event, context):
    data = event
    print("dados: ",data)

    #capturando dados 
    if(data.get("nome") and data.get("idade") and data.get("cargo")):
        print("gravando")
        id    = int(data.get("id"))
        nome  = data.get("nome")
        idade = data.get("idade")
        cargo = data.get("cargo")
        dynamodb = boto3.resource("dynamodb")
        table = dynamodb.Table(os.environ["DB_TABLE_NAME"])
        
        table.put_item(
            Item = {
                "id":id,
                "nome": nome,
                "idade": idade,
                "cargo":cargo
            })
        return{
            'statusCode':200,
            'message':"Salvo com sucesso"
        }
        

    else:
        return{
            'statusCode': 400,
            'message': "Atributos faltando, obrigatorio (id, nome, idade, cargo)"
        }
    