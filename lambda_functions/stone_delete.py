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
    if(data.get("id")):
        dynamodb = boto3.resource("dynamodb")
        table = dynamodb.Table(os.environ["DB_TABLE_NAME"])
        #user = str(event["user"])
        id = int(event["id"])

        #print("user",user)
        print("id", id)

        table.delete_item(
            Key={
            'id': id
            })

        return{
            'statusCode':200,
            'message':"Deletado com sucesso"
        }
        

    else:
        return{
            'statusCode': 400,
            'message': "Atributos faltando, obrigatorio (nome)"
        }
    