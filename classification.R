library('rpart')
library('caret')
source('metrics.R')

classification <- function() {
  # Carrega o dataset de transfusões de sangue em um dataframe
  dataFrame <- read.table('datasets/Blood-Transfusion-Dataset.csv', header = TRUE, sep = ",")
  
  # Escolhe valores do dataframe aleatoriamente de forma estratificada (sendo 75% para treinamento e 25% para teste)
  sample <- createDataPartition(dataFrame$Donated, p = 0.75, list = FALSE)
  
  trainSample <- dataFrame[sample,]
  testSample <- dataFrame[-sample,]
  
  # Constrói a árvore de decisão para o conjunto de treinamento dado
  model <- rpart(formula = Donated ~ Recency + Frequency + Monetary + Time, 
                 data = trainSample, method = "class", control = rpart.control(minsplit = 1), 
                 parms = list(split = "Information"), model = TRUE)
  
  # Realiza a predição no conjunto de testes
  predicted <- predict(model, testSample, type = "class")
  
  # Monta a matriz de confusão para cálculo das métricas de precisão e acurácia
  confMat <- table(predicted=predicted, truth=testSample$Donated)
  accuracy <- accuracy(confMat) 
  precision <- precision(confMat)
  
  # Carrega os dados coletados em uma lista que será retornada
  result <- list()
  result$model <- model
  result$accuracy <- accuracy
  result$precision <- precision
  
  return(result)
}