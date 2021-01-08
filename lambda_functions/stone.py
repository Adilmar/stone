import json
import random
from botocore.vendored import requests
import os
import time

MSG_SUCESSO_NOVO   = "✅ Salvo com sucesso!"
MSG_SUCESSO_DELETE = "✅ Deletado com sucesso!"
MSG_ERRO           = "❗ Aconteceu um erro tente novamente"
MSG_NOT_FOUND      = "❗ Funcionário não encontrado!"

def buscar(nome):
    nome = str(nome)
    url = "https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/search"
     
    payload="{\r\n    \"nome\":\""+nome+"\"\r\n}"
    
    headers = {
        'Content-Type': 'application/json'
        
    }

    response = requests.post(url, headers=headers, data=payload)
    print("oi",response.text)
    
    return response.json()

def deletar(matricula):
    matricula = str(matricula)
    url = "https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/delete"
     
    payload="{\r\n    \"id\":"+matricula+"\r\n}"
    
    headers = {
        'Content-Type': 'application/json'
        
    }

    response = requests.post(url, headers=headers, data=payload)
    print("oi",response.text)
    
    return response.json()


def registrar(matricula,nome,idade,cargo):
    matricula = str(matricula)
    idade     = str(idade)
    url = "https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/register"
     
    payload="{\r\n    \"id\":"+matricula+",\r\n    \"nome\":\""+nome+"\",\r\n    \"idade\":"+idade+",\r\n    \"cargo\":\""+cargo+"\"\r\n}"
    
    headers = {
        'Content-Type': 'application/json'
        
    }

    response = requests.post(url, headers=headers, data=payload)
    print("oi",response.text)
    
    return response.json()


def lambda_handler(event, context):
    print("event",event)
    # TODO implement
    if(event.get("queryResult")):
        acao  = event["queryResult"]["action"]
        texto = event["queryResult"]["queryText"]
                
        if(acao == "register"):
            print("ok")
            dados     = event["queryResult"]["outputContexts"][0]["parameters"]
            print("aquii",dados)
            nome      = dados.get("nome")
            idade     = int(dados.get("idade"))
            matricula = int(dados.get("matricula"))
            cargo      = dados.get("cargo")
            
            print("nome",nome)
            print("matricula",matricula)
            print("idade",idade)
            print("cargo,cargo")
            
            resultado = registrar(matricula,nome,idade,cargo)
            
            estado = resultado.get("statusCode")
            
            print("estado",estado)
   
            return{
                "source":"",
                "fulfillmentText":MSG_SUCESSO_NOVO,
                "fulfillmentMessages": [
                        {
                            "text": {
                                "text": [MSG_SUCESSO_NOVO]
                                
                            }
                            
                        }]
                 }

        if(acao == "delete"):
                print("ok")
                dados     = event["queryResult"]["outputContexts"][0]["parameters"]
                print("aquii",dados)
                matricula = int(dados.get("matricula"))
                
                resultado = deletar(matricula)
                
                estado = resultado["statusCode"]
                
                #print("estado",estado)
                
                estado = int(estado)
                
                if(estado==200):
                    return{
                    "source":"",
                    "fulfillmentText":MSG_SUCESSO_DELETE,
                    "fulfillmentMessages": [
                            {
                                "text": {
                                    "text": [MSG_SUCESSO_DELETE]
                                    
                                }
                                
                            }]
                    }
                else:
                    return{
                    "source":"",
                    "fulfillmentText":MSG_ERRO,
                    "fulfillmentMessages": [
                            {
                                "text": {
                                    "text": [MSG_ERRO]
                                    
                                }
                                
                            }]
                    }
        
        if(acao == "search"):
                print("ok")
                dados     = event["queryResult"]["outputContexts"][0]["parameters"]
                print("aquii",dados)
                nome = str(dados.get("nome"))
                
                resultado = buscar(nome)

                print("vvv",resultado)

                try:
                    if(resultado["nome"]):
                        estado     = resultado["statusCode"]
                        nome_fun   = resultado["nome"]
                        idade      = resultado["idade"]
                        cargo      = resultado["cargo"]
                        matricula  = resultado["id"]

                        MSG_SUCESSO_PESQUISA = f"😀Funcionário encontrado segue os dados \n\nMatrícula:{matricula}\nNome:{nome_fun}\nIdade:{idade}\nCargo:{cargo}"
                        
                        print("xxxx",estado)
                        
                        estado = int(estado)
                        
                        if(estado==200):
                            return{
                            "source":"",
                            "fulfillmentText":MSG_SUCESSO_PESQUISA,
                            "fulfillmentMessages": [
                                    {
                                        "text": {
                                            "text": [MSG_SUCESSO_PESQUISA]
                                            
                                        }
                                        
                                    }]
                            }
                except KeyError:
                    return{
                        "source":"",
                        "fulfillmentText":MSG_NOT_FOUND,
                        "fulfillmentMessages": [
                                {
                                    "text": {
                                        "text": [MSG_NOT_FOUND]
                                        
                                    }
                                    
                                }]
                        }
            
                    
                
                
    
                