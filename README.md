# ChatBot - Stone Dev (API) 

------

## Introdução

Esse documento tem como objetivo descrever o funcionamento da API para o chatbot de teste para a Stone.

### Dados  do chatbot 

**Telegram nome do bot:** stonedev_bot 

Link geral da API: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/`



###  Função - REGISTER

**URL**: `https://ezveld0pn1.execute-api.us-east-2.amazonaws.com/dev/register`

Essa função tem como funcionalidade gravar os dados de um funcionário, são eles: `id, nome, idade, cargo`.

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



## Dúvidas e sugestões 

- Adilmar Dantas - akanehar@gmail.com