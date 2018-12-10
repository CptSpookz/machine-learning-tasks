library('rpart.plot')
source('classification.R')
source('regression.R')

# 1. Classificação
classResult <- classification()
cat("Método de Classificação:\n")
cat("Acurácia: ",classResult$accuracy,"\n" )
cat("Precisão: ",classResult$precision,"\n\n")
rpart.plot(classResult$model)

# 2. Regressão
regrResult <- regression()
cat("Método de Regressão:\n")
cat("Erro Quadrado Médio: ",regrResult$mse,"\n")
rpart.plot(regrResult$model)