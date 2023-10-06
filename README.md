# Script Terraform para provisionar um Cluster Kubernetes EKS na AWS

## Objetivo

Este repositório contém um script Terraform para provisionar um cluster EKS na AWS com uma VPC e subnets em múltiplas regiões. O cluster é configurado para usar o mínimo de hardware, especificamente uma máquina `t3.micro`.

A região padrão configurada é `us-east-1`, mas é possível alterar isso e outras configurações no arquivo `variables.tf` localizado na raiz do projeto. Neste arquivo também é possível alterar o nome do cluster a ser criado.

## Pré-requisitos
- Git
- Terraform: Certifique-se de ter o Terraform instalado.
- AWS CLI: A CLI da AWS deve estar instalada e configurada.
- kubectl: É necessário ter o kubectl instalado para acessar o cluster EKS.
- Configurando a AWS CLI

## Clonar o repo do Github
```bash
git clone https://github.com/madsonar/terraform-aws-cluster-eks-kubernetes.git
```

## Após instalar a AWS CLI, execute o seguinte comando para configurá-la:

```bash
aws configure
```

## Será solicitado que você forneça as seguintes informações:

AWS Access Key ID: [Sua Access Key ID]
AWS Secret Access Key: [Sua Secret Access Key]
Default region name: [Sua Região, ex: us-east-1]
Default output format: [Formato de Saída, ex: json]

## Como Usar
- Siga os passos abaixo para provisionar sua infraestrutura usando Terraform:

Inicialização:
```bash
terraform init
```

Formatar o Código Terraform:
```bash
terraform fmt
```

Validar o Script Terraform:
```bash
terraform validate
```

Visualizar Mudanças:
```bash
terraform plan
```

Aplicar Mudanças:
```bash
terraform apply
```

Destruir Infraestrutura (quando necessário):
```bash
terraform destroy
```

## Acessando o Cluster
Após provisionar o cluster EKS, você pode configurar o kubectl para acessá-lo usando o seguinte comando:

```bash
aws eks update-kubeconfig --region us-east-1 --name eks-cluster-dc
```