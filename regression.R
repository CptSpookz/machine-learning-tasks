library('rpart')
library('caret')
source('metrics.R')

regression <- function() {
  dataFrame <- read.table('datasets/Servo-Dataset.csv', header = TRUE, sep = ",")
  
  # Escolhe valores do dataframe aleatoriamente (sendo 75% para treinamento e 25% para teste)
  sample <- createDataPartition(dataFrame$Class, p = 0.75, list = FALSE)
  
  trainSample <- dataFrame[sample,]
  testSample <- dataFrame[-sample,]
  
  # Constrói a árvore de regressão para o conjunto de treinamento dado
  model <- rpart(formula = Class ~ Motor + Screw + PGain + VGain, 
                 data = trainSample, method = "anova", model = TRUE)
  
  # Realiza a predição no conjunto de testes e plota o modelo
  predicted <- predict(model, testSample, type = "vector")

  # Calcula o erro quadrático médio a partir do vetor de predição e do vetor de dados reais
  error <- mse(testSample$Class, predicted)
  
  # Carrega os dados coletados em uma lista que será retornada
  result <- list()
  result$model <- model
  result$mse <- error
  
  return(result)
}