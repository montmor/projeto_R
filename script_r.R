
Historico <- read.xlsx ("Historico.xlsx")

summary(Historico)

#Para encontrar os valores N/A
Historico[is.na(Historico$Rotacao), ]

#Para corrigir os valores N/A
Historico$Rotacao =ifelse(is.na(Historico$Rotacao), mean(Historico$Rotacao, na.rm = TRUE), Historico$Rotacao)

#Escalonamento de atributos
Historico[,1:10] = scale(Historico[,1:10])

#Divindo o Historico em  base de Teste e de Treinamento
install.packages('caTools')
library(caTools)
set.seed(1)
divisao = sample.split(Historico$Desgaste, SplitRatio = 0.75)
Historico_Treinamento = subset(Historico, divisao == TRUE)
Historico_Teste = subset(Historico, divisao == FALSE)

#intalacao

install.packages("caret")


install.packages("e1071", dependencies = TRUE)
install.packages("caret", dependencies = TRUE)
install.packages("lme4", dependencies = TRUE)
install.packages("pbkrtest", dependencies = TRUE)
install.packages("...",repos = NULL, type="source")
install.packages("pbkrtest", dependencies = TRUE)
install.packages("caret",
                 repos = "http://cran.r-project.org",
                 dependencies = c("Depends", "Imports", "Suggests"))


update.packages("pbkrtest")
update.packages("caret")

library(caret)
library(lme4)
methods(sigma)
library(caret)

?train

lm1 <- train(Historico_Treinamento$co + Historico, data = pso, method = "lm")
lm2 <- train(Historico_Treinamento, data = pso, method = "lm")

