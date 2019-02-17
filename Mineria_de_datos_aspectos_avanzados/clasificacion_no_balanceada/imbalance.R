#CARMEN BIEDMA RODRGIUEZ

library(caret)
library(dplyr)
library(pROC)
library(tidyr)
library(imbalance)

learn_model <-function(dataset, ctrl,message){
  knn.fit <- train(Class ~ ., data = dataset, method = "knn", 
                   trControl = ctrl, preProcess = c("center","scale"), metric="ROC", 
                   tuneGrid = expand.grid(k = c(1,3,5,7,9,11)))
  knn.pred <- predict(knn.fit,newdata = dataset)
  #Get the confusion matrix to see accuracy value and other parameter values
  knn.cm <- confusionMatrix(knn.pred, dataset$Class,positive = "positive")
  knn.probs <- predict(knn.fit,newdata = dataset, type="prob")
  knn.roc <- roc(dataset$Class,knn.probs[,"positive"],color="green")
  return(knn.fit)
}

test_model <-function(dataset, knn.fit,message){
  knn.pred <- predict(knn.fit,newdata = dataset)
  #Get the confusion matrix to see accuracy value and other parameter values
  knn.cm <- confusionMatrix(knn.pred, dataset$Class,positive = "positive")
  print(knn.cm)
  knn.probs <- predict(knn.fit,newdata = dataset, type="prob")
  knn.roc <- roc(dataset$Class,knn.probs[,"positive"])
  #print(knn.roc)
  plot(knn.roc, type="S", print.thres= 0.5,main=c("ROC Test",message),col="blue")
  #print(paste0("AUC Test ",message,auc(knn.roc)))
  return(knn.cm)
}

#load dataset
#dataset <- read.table("subclus.txt", sep=",")
dataset <- read.table("circle.txt", sep=",")
colnames(dataset) <- c("Att1", "Att2", "Class")
summary(dataset)

# visualize the data distribution
plot(dataset$Att1, dataset$Att2)
points(dataset[dataset$Class=="negative",1],dataset[dataset$Class=="negative",2],col="red")
points(dataset[dataset$Class=="positive",1],dataset[dataset$Class=="positive",2],col="blue")  

#Additional:
data(glass0)
#dataset <- glass0

imbalanceRatio(dataset)

#Create Data Partition
set.seed(42)
dataset$Class <- relevel(dataset$Class,"positive")
index <- createDataPartition(dataset$Class, p = 0.7, list = FALSE)
train_data <- dataset[index, ]
test_data  <- dataset[-index, ]

#Execute model ("raw" data)
ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary)
model.raw <- learn_model(train_data,ctrl,"RAW ")
#plot(model,main="Grid Search RAW")
print(model.raw)
cm.raw <- test_model(test_data,model.raw,"RAW ")

#Execute model ("preprocessed" data)
#Undersampling : Se especifica en el parametro sampling con down, up o smote.
ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary,sampling = "down")
model.us <- learn_model(train_data,ctrl,"RAW ")
cm.us <- test_model(test_data,model.us,"RAW ")

#Oversampling
ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary,sampling = "up")
model.os <- learn_model(train_data,ctrl,"RAW ")
cm.os <- test_model(test_data,model.os,"RAW ")

#Smote
ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary,sampling = "smote")
model.smt <- learn_model(train_data,ctrl,"RAW ")
cm.smt <- test_model(test_data,model.smt,"RAW ")


#Check model's behavior
models <- list(raw = model.raw,
               us = model.us,
               os = model.os,
               smt = model.smt)

resampling <- resamples(models)
bwplot(resampling)

comparison <- data.frame(model = names(models),
                         Sensitivity = rep(NA, length(models)),
                         Specificity = rep(NA, length(models)),
                         Precision = rep(NA, length(models)),
                         Recall = rep(NA, length(models)),
                         F1 = rep(NA, length(models)))

for (name in names(models)) {
  cm_model <- get(paste0("cm.",name))
  
  comparison[comparison$model == name, ] <- filter(comparison, model == name) %>%
    mutate(Sensitivity = cm_model$byClass["Sensitivity"],
           Specificity = cm_model$byClass["Specificity"],
           Precision = cm_model$byClass["Precision"],
           Recall = cm_model$byClass["Recall"],
           F1 = cm_model$byClass["F1"])
}

comparison %>%
  gather(x, y, Sensitivity:F1) %>%
  ggplot(aes(x = x, y = y, color = model)) +
  geom_jitter(width = 0.2, alpha = 0.5, size = 3)

#Paquete imbalance y combinacion de tecnicas para el dataset subclus

#Create Data Partition
dataset.subclus <- read.table("subclus.txt", sep=",")
colnames(dataset.subclus) <- c("Att1", "Att2", "Class")
summary(dataset.subclus)

# visualize the data distribution
plot(dataset.subclus$Att1, dataset.subclus$Att2)
points(dataset.subclus[dataset.subclus$Class=="negative",1],dataset.subclus[dataset.subclus$Class=="negative",2],col="red")
points(dataset.subclus[dataset.subclus$Class=="positive",1],dataset.subclus[dataset.subclus$Class=="positive",2],col="blue")  

imbalanceRatio(dataset.subclus)
#Este dataset está menos desbalanceado que el otro ya que el ratio que nos da es más grande que el de antes.

set.seed(42)
dataset.subclus$Class <- relevel(dataset.subclus$Class,"positive")
index <- createDataPartition(dataset.subclus$Class, p = 0.7, list = FALSE)
train_data.subclus <- dataset[index, ]
test_data.subclus  <- dataset[-index, ]

#Adasyn

new_train.adasyn <- oversample(dataset = train_data.subclus,method = "ADASYN")

plotComparison(train_data.subclus, new_train.adasyn, cols = 2, attrs = names(dataset[1:2]))

ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary)
model.adasyn <- learn_model(new_train.adasyn,ctrl," RAW ")
cm.adasyn <- test_model(test_data.subclus,model.adasyn," RAW ")

#DBSMOTE

new_train.dbsmote <- oversample(dataset = train_data.subclus,method = "DBSMOTE",ratio=0.7)
plotComparison(train_data.subclus, new_train.dbsmote, cols = 2, attrs = names(dataset[1:2]))

ctrl <- trainControl(method="repeatedcv",number=5,repeats = 3,
                     classProbs=TRUE,summaryFunction = twoClassSummary)
model.dbsmote <- learn_model(new_train.dbsmote,ctrl," RAW ")
cm.dbsmote <- test_model(test_data.subclus,model.dbsmote," RAW ")

#Comparaciones

#Check model's behavior
models <- list(dbsmote = model.dbsmote,
               adasyn= model.adasyn)

resampling <- resamples(models)
bwplot(resampling)

comparison <- data.frame(model = names(models),
                         Sensitivity = rep(NA, length(models)),
                         Specificity = rep(NA, length(models)),
                         Precision = rep(NA, length(models)),
                         Recall = rep(NA, length(models)),
                         F1 = rep(NA, length(models)))

for (name in names(models)) {
  cm_model <- get(paste0("cm.",name))
  
  comparison[comparison$model == name, ] <- filter(comparison, model == name) %>%
    mutate(Sensitivity = cm_model$byClass["Sensitivity"],
           Specificity = cm_model$byClass["Specificity"],
           Precision = cm_model$byClass["Precision"],
           Recall = cm_model$byClass["Recall"],
           F1 = cm_model$byClass["F1"])
}

comparison %>%
  gather(x, y, Sensitivity:F1) %>%
  ggplot(aes(x = x, y = y, color = model)) +
  geom_jitter(width = 0.2, alpha = 0.5, size = 3)
