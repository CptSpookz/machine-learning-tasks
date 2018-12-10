# machine-learning-tasks
Repositório do 3º Trabalho da disciplina de Inteligência Artificial 

## Objetivo
Executar o treinamento de classificadores, construindo árvores de classificação e regressão para 2 datasets diferentes em R.

## Datasets
- Classificação:
[Blood Transfusion Service Center Data Set](http://archive.ics.uci.edu/ml/datasets/Blood+Transfusion+Service+Center)
- Regressão:
[Servo Motor Data Set](http://archive.ics.uci.edu/ml/datasets/Servo)

## Métricas
Classificação:

- Precisão: TP / (TP + FP)
- Acurácia: (TP + TN) / Todos os Valores
  
Regressão:

- Erro Quadrático Médio: avg(Dados Reais - Dados Preditos) ^ 2
  
## Dependências
Este projeto necessita dos pacotes `rpart, rpart.plot e caret` para rodar. Para instalá-los, basta rodar o comando `install.packages('<nome do pacote>')` no diretório do projeto para cada um dos pacotes citados anteriormente.