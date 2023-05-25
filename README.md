# S3 como webserver usando Terraform
Nesse projeto você pode fazer o deploy de um site local, no bucket S3 da AWS. 

## Estrutura do Terraform

### s3.tf 
Arquivo usado para declarar os recursos da AWS

### variables.tf
Usado para declarar as variáveis que serão usadas nos outros arquivos.

### main.tf
Arquivo padrão do Terraform, onde declaramos configurações básicas como provider a ser utilizado, credencial a ser utilizada, região que a infra será configurada, e em qual backend o terraform executará.

### terraform.tfvars
Arquivo onde é declarado os inputs para as variáveis criadas no variables.tf, lembrando que esses valores quando declarados, substituirão o valor default das variáveis.

## Configuração inicial
Para quem nunca usou o Terraform, e não sabe como configurar, dentro da pasta DOCS desse repositório, há um arquivo em PDF com as instruções para configuração do seu ambiente. 

## Site web
Na pasta agência dentro desse repositório, você pode usar os arquivos que estão configurados no variables.tf, porém indico que você faça o teste usando um site seu.
