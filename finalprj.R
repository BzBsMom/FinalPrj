#library(caret);
#Dhar<-read.csv("pml-training.csv")
##na.strings=c("","#DIV/0!"))
#testing<-read.csv("pml-testing.csv")

# Clean the data by removing columns with NA
#Dhar<-Dhar[,colSums(is.na(Dhar)) == 0]

# Deciding which are the predictors to include
#nsv<-nearZeroVar(Dhar,saveMetrics=TRUE)
# Eliminate variables that add little variability
#predictor<-row.names(nsv[nsv$nzv == FALSE,])
#Dhar<-Dhar[,predictor]
#Dhar<-Dhar[,-1]
#set.seed(1000)
#indx<-createDataPartition(y=Dhar$classe,p=0.7,list=FALSE)
#trainingM<-Dhar[indx,]
#testingM<-Dhar[-indx,]

modfit<-train(classe~.,method="rf",data=trainingM,ntree=10)
Ptest<-predict(modfit,newdata=testingM)

answers = predict(modfit,newdata=testing)
#pml_write_files = function(x){
#    n= length(x)
#    for (i in 1:n){
#        filename = paste0("problem_id_",i,".txt")
#        write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
#    }
#}

#pml_write_files(answers)

