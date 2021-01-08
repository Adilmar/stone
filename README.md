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











Introdução a interface  e funcionalidades suportadas atualmente

- Atualmente através dessa interface é possível realizar a importação de três tipos de extensões de arquivos: (`TXT, ZIP, 7Z`) portanto nossos teste terão como base esses três formatos;

- Os métodos de conexão suportados atualmente são (`FTP, FTPS, SFTP`);

- Atualmente é possível também configurar scripts (`script de validação, script de formatação, script de procesados`)

  ------

  

  ## Configurações de conexão 

  Abaixo segue as principais configurações de conexão mencionadas anteriormente

  ------

  

  ### Configurações para FTP

  - **Nome da conexão** : FTP TESTE

  - **Ordem de processamento**: 1
  - **Protocolo**: FTP
  - **HOST**: 10.225.73.166
  - **Porta** : 21
  - **Usuário**: algartech
  - **Senha**: CDI@lg@r

  

  ### Configurações para FTPS

  - **Nome da conexão** : FTPS TESTE

  - **Ordem de processamento**: 1
  - **Protocolo**: FTPS
  - **HOST**: 54.89.6.28
  - **Porta** : 990
  - **Usuário**: cdi
  - **Senha**: permitido@7

  

  ### Configurações para SFTP

  - **Nome da conexão** : SFTP TESTE

  - **Ordem de processamento**: 1
  - **Protocolo**: SFTP
  - **HOST**: sftp.algartech.com
  - **Porta** : 22
  - **Usuário**: bradcancelados
  - **Senha**: eyQc4uze20

Essas informações devem ser informadas em cada novo teste, como mostrado na Figura a seguir:

![Figura 2: Configurando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr2.jpg)



### Patch dos arquivos para cada tipo de conexão: 

**FTP**: `/home/algartech/teste-avon/matheus`

``C00003300ACS97.zip` 
`C00003300ACS4.zip` 
`BT00002475LIDERAN.TXT.7Z` 
`BT00002332WARM.TXT.7Z` 
`BT00001326GRB.TXT.7Z` 
`BT00000532COBCRED.TXT.7Z` 
`BT00000052ALGAR.TXT.7Z` 
`C00003300ACS97.TXT` 
`C00003300ACS4.TXT`` 

**FTPS**: `/teste-avon/matheus/`

``C00003300ACS97.zip` 
`C00003300ACS4.zip` 
`BT00002475LIDERAN.TXT.7Z` 
`BT00002332WARM.TXT.7Z` 
`BT00001326GRB.TXT.7Z` 
`BT00000532COBCRED.TXT.7Z` 
`BT00000052ALGAR.TXT.7Z` 
`C00003300ACS97.TXT` 
`C00003300ACS4.TXT`` 

**SFTP**: `/arquivos_bradcancelados/teste-avon/matheus/`

``C00003300ACS97.zip` 
`C00003300ACS4.zip` 
`BT00002475LIDERAN.TXT.7Z` 
`BT00002332WARM.TXT.7Z` 
`BT00001326GRB.TXT.7Z` 
`BT00000532COBCRED.TXT.7Z` 
`BT00000052ALGAR.TXT.7Z` 
`C00003300ACS97.TXT` 
`C00003300ACS4.TXT`` 



## Exemplos de testes:

**Exemplo 1**

- **Tipo de conexão**: FTP
- **Extensão do arquivo**: ZIP
- **Script de Formatação**: Não
- **Script de Validação**: Não 
- **Script de Processados**: Não

**Passo 1**: O primeiro passo a ser realizado é a configuração da conexão como mencionado anteriormente, uma vez configurado deve-se clicar em `salvar`, e após esse processo em `verificar` o mesmo deverá retorna uma mensagem em forma toast conforme demonstrado na Figura a seguir: 

![Figura 3: Salvando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr3.jpg)

![Figura 4: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr4.jpg)![Figura 5: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr5.jpg)

**Passo 2**: O próximo passo é configurar o patch do arquivo neste casso é apenas um arquivo ZIP sem script de formatação e nem de validação. Olhando passa os patch mencionados anteriormente o correto para esse caso seria: `/home/algartech/teste-avon/matheus/C00003300ACS4.zip`. Configure o patch do arquivo como a Figura abaixo, `salve` a configuração e clique sobre o botão `enviar`, se tudo ocorrer bem você terá como resposta a seguinte mensagem "**Arquivo enviado com sucesso**".

![Figura 6: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr6.jpg)![Figura 7: Verificando envio de arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr7.jpg)

**Passo 3**: Uma vez enviado o arquivo deve-se verificar se o mesmo foi enviado ao webdav, o webdav é um repositório de arquivos do CDI. Para isso acesse o link http://webdav.dudadev.algar.tech/ acesse o diretório respectivo ao `ano/mês/dia` do arquivo enviado como demonstrado abaixo, se o arquivo estiver no repositório conferir o mesmo para garantir que o processo de importação foi realizado com sucesso.

![Figura 13: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr13.jpg)

**Acessando o Webdav**

Para acessar o webdav do cdi em dev é necessário editar o arquivo de host de sua maquina localizado em : `C:\Windows\System32\drivers\etc` adicione a seguinte instrução: **54.85.241.27    webdav.dudadev.algar.tech** veja a seguir como deve ficar no arquivo.

![Figura 15: Edição host](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr15.jpg)

**Exemplo 2**

- **Tipo de conexão**: FTP
- **Extensão do arquivo**: ZIP
- **Script de Formatação**: Sim
- **Script de Validação**: Não 
- **Script de Processados**: Não

Para esse exemplo iremos executar os passos 1, 2 e 3 do **exemplo 1**. No campo referente ao caminho do arquivo clique sobre a engrenagem de configuração conforme demonstrado na Figura abaixo. O script de formatação tem como função formatar o arquivo que esta sendo enviado para o webdav.

![Figura 4: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr8.jpg)

**Passo 3*: Após isso marque a opção "**Ativar Script de Formatação**"

![Figura 4: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr9.jpg)

**Passo 4**: Em seguida clique sobre a informação "**Script de Formatação**" no menu superior.

![Figura 4: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr10.jpg)

**Passo 5**: Na próxima tela clique sobre "**Script Modelo**" em seguida será exibido um script padrão conforme a Figura abaixo.

![Figura 4: Verificando conexão](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr12.jpg)



**Passo 6**: Feito isso salve e envie o arquivo e verificar no [webdav](http://webdav.dudadev.algar.tech/) se no mesmo foi adicionado as informações decorrentes do script `record + "|" + ln + "|" + filename`, como abaixo veja. 

![Figura 14: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr13.jpg)

![Figura 6: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr14.jpg)



**Exemplo 3**

- **Tipo de conexão**: FTP
- **Extensão do arquivo**: ZIP
- **Script de Formatação**: Não
- **Script de Validação**: Sim
- **Script de Processados**: Não

Nesse exemplo iremos importar um arquivo contendo um script de validação, esse script tem como função facilitar a importação de muitos arquivos. Nesse exemplo temos mais de um arquivo .zip para facilitar a importação podemos então criar um script que vare o diretório remoto a procura de uma determina extensão e me retorna todos os arquivos com essa extensão para serem importados. 

**Passo 1**: O primeiro passo a ser realizado e remover o nome do arquivo do patch conforme a Figura a seguir:

![Figura 20: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr20.jpg)

**Passo 2**: Logo em seguida clique sobre a engrenagem e habilite o script de validação e acesse a interface do mesmo como a seguir.

![Figura 16: Script de validação](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr16.jpg)

![Figura 17: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr17.jpg)



**Passo 3**: Agora devemos substituir o script regex fornecido pelo seguinte script: `^.*.zip$` e clicar em Aplicar.

![Figura 18: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr18.jpg)

![Figura 19: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr19.jpg)

**Passo 4**: Feito isso salve as configurações e envie os arquivos, após a conclusão repetir o processo de verificação no [webdav](http://webdav.dudadev.algar.tech/) como mencionado nos passos anteriores. 

**Exemplo 4**

- **Tipo de conexão**: FTP
- **Extensão do arquivo**: ZIP
- **Script de Formatação**: Não
- **Script de Validação**: Não 
- **Script Processados**: Sim

Nesse exemplo basta repetir os procedimentos mencionados no passo 1, e ativar o script mover para processados e informar o caminho para onde os arquivos serão enviados, conforme a Figura a seguir.

![Figura 21: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr21.jpg)

Após a importação basta acessa o serviço de conexão (FT´P, FTPS, SFTP) no diretório `processados` e verificar se o arquivo enviado consta no mesmo.

![Figura 22: Caminho do arquivo](https://gitlab.algartech.com/internos/ppes/cobranca/cdi-docs/raw/master/cdi-project/wallet/scr22.jpg)

## Possíveis Casos de Testes  Necessários
| Teste | Extensão   | Conexão (3X)  | Validação | Formatação | Tamanho (2X) |
| ----- | ---------- | ------------- | --------- | ---------- | ------------ |
| 1     | TXT        | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 2     | TXT        | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 3     | TXT        | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 4     | TXT        | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 5     | ZIP        | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 6     | ZIP        | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 7     | ZIP        | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 8     | ZIP        | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 9     | 7Z         | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 10    | 7Z         | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 11    | 7Z         | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 12    | 7Z         | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 13    | TXT/ZIP    | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 14    | TXT/ZIP    | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 15    | TXT/ZIP    | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 16    | TXT/ZIP    | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 13    | TXT/7Z     | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 14    | TXT/7Z     | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 15    | TXT/7Z     | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 16    | TXT/7Z     | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 17    | ZIP/7Z     | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 18    | ZIP/7Z     | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 19    | ZIP/7Z     | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 20    | ZIP/7Z     | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |
| 21    | TXT/ZIP/7Z | FTP/FTPS/SFTP | NÃO       | NÃO        | P/G          |
| 22    | TXT/ZIP/7Z | FTP/FTPS/SFTP | SIM       | NÃO        | P/G          |
| 23    | TXT/ZIP/7Z | FTP/FTPS/SFTP | SIM       | SIM        | P/G          |
| 24    | TXT/ZIP/7Z | FTP/FTPS/SFTP | NÃO       | SIM        | P/G          |



## Dúvidas e sugestões 

- Adilmar Dantas - adilmarcd@algartech.com
- Silvio Romero - 
- Rafael Soterro -
- Matheus -
- Neverson -
- Renan Gonzáles - 