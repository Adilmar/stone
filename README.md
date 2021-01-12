<center><img width="15%" alt="stone" src="https://raw.githubusercontent.com/Adilmar/stone/main/images/logo.png">
</center>

# ChatBot - Stone Dev (API) 

------

## Introdução

Esse documento tem como objetivo descrever o funcionamento da API para o chatbot de teste para a Stone.

### Dados  do chatbot 

**Telegram nome do bot:** [stonedev_bot](https://web.telegram.org/#/im?p=@stonedev_bot) 

Link geral da API: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/`



###  Função - REGISTER  e UPDATE

**URL**: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/register`

Essa função tem como funcionalidade gravar os dados de um funcionário, são eles: `id, nome, idade, cargo`.

Observação: *Como estamos usando o DynamoDB podemos utilizar a mesma função de registro para atualizar o funcionário.* 

### Exemplo de chamada 

**Headers**

```python
headers = {
  'Content-Type': 'application/json'
}
```

**Body** 

```json
{
    "id":2,
    "nome":"Adilmar Coelho Dantas",
    "idade":28,
    "cargo":"Analista de Ti"
}
```

**Response**

```json
{
    "statusCode": 200,
    "message": "Salvo com sucesso"
}
```

**Função - SEARCH**

**URL**: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/search`

Essa função tem como funcionalidade de pesquisar um funcionário pelo seu `nome`.

### Exemplo de chamada 

**Body**:

```json
{
    "nome":"Adilmar Coelho Dantas"
}
```

**Response**

```json
{
    "statusCode": 200,
    "message": "Funcionario encontrado!",
    "id": 2,
    "nome": "Adilmar Dantas",
    "idade": 28,
    "cargo": "Analista de Ti"
}
```

**Função - DELETE**

**URL**: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/delete`

Essa função tem como funcionalidade deletar um funcionário pelo seu `id`.

### Exemplo de chamada 

**Body**:

```json
{
    "id":2
}
```

**Response**

```json
{
    "statusCode": 200,
    "message": "Deletado com sucesso"
}
```

------

## Terraform (AWS)

Para realizar o deploy da API na AWS basta editar o arquivo [Terraform](https://github.com/Adilmar/stone/blob/main/terraform/stone_terra.tf) com as suas credenciais:

`access_key`, `secret_key`

Após isso execute o comendo: `terraform plan` e em seguida `terraform apply`.

**Instalando no Windows** 

Sentando variáveis de ambiente no Windows

`set PATH=%PATH%;C:\terraform`

## Dúvidas e sugestões 

- Adilmar Dantas - akanehar@gmail.com