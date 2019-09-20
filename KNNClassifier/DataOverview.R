install.packages("tidyverse")
library(ggplot2)

# MNIST
MNIST <- read.table("C:\\Users\\Fantacy\\OneDrive\\Macine Learning\\MNIST\\train.csv",header = TRUE, sep=",")
Label_For_Hist <- MNIST$label+0.1
hist(Label_For_Hist,main="Distribution of MNIST Dataset", xlab="Digit", ylim=c(0,5000),freq = TRUE,xaxp=c(0,9,9),breaks =c(0, seq(0,10,1)),col=rainbow(10))
abline(h=seq(0,4000,1000),col="gray",lty="dotted")
digit=c('0','1','2','3','4','5','6','7','8','9')
frequency <- c(4132,4684,4177,4351,4072,3795,4137,4401,4063,4188)
df1 <- data.frame(x=digit,y=frequency)
gg_MNIST <- ggplot(data=df1, mapping=aes(x=digit,y=frequency))+geom_bar(stat='identity',width = 0.8,fill=rainbow(10)) + theme(axis.text = element_text(size = 14)) + theme(text = element_text(size = 20))
gg_MNIST + geom_text(data =df1, aes(label = frequency),position = position_dodge(width=0.9),  size=6)
# hist(Label_For_Hist~digit,main="Distribution of MNIST Dataset", xlab="Digit", ylim=c(0,5000),freq = TRUE,xaxp=c(0,9,9),breaks =c(0, seq(0,10,1)),col=rainbow(10))


# Pima-Indians-Diabetes
diabetes <- read.table("C:\\Users\\Fantacy\\OneDrive\\Macine Learning\\KNN_Pima\\diabetes.csv",header = TRUE, sep=",")
hist(diabetes$Outcome)
Outcome <- c('0','1')
Frequency <- c(500,268)
df <- data.frame(x=Outcome,y=Frequency)
gg_outcome <- ggplot(data=df, mapping=aes(x=Outcome,y=Frequency)) + geom_bar(stat='identity',width = 0.9,fill=c('firebrick3','cyan3'))
gg_outcome <- gg_outcome + geom_text(data =df, aes(label = Frequency),position = position_dodge(width=0.9),  size=6) 
gg_outcome + theme(axis.text = element_text(size = 14)) + theme(text = element_text(size = 20))
PregnanciesFrenquency <- c(111, 135, 103,  75,  68,  57,  50,  45,  38,  28,  24,  11,   9,  10,   2,   1,0,   1 )
Pregnancies<-c(0:17)
df_pregnancies <- data.frame(x=Pregnancies,y=PregnanciesFrenquency)
g_Pregnancy <- ggplot(data=df_pregnancies, mapping=aes(x=Pregnancies,y=PregnanciesFrenquency))+geom_bar(stat='identity',width = 0.9,fill=rainbow(18)) + geom_text(data =df_pregnancies, aes(label = PregnanciesFrenquency),position = position_dodge(width=0.9),  size=8)
g_Pregnancy + theme(axis.text = element_text(size = 18)) + theme(text = element_text(size = 18))
# Glucose
df_Glucose <- data.frame(table(cut(diabetes$Glucose,breaks=c(0:10)*20)))
gg_Glucose <- ggplot(data=df_Glucose, mapping=aes(x=df_Glucose$Var1,y=df_Glucose$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(10))
gg_Glucose <- gg_Glucose + xlab("Glucose") + ylab("Frequency")
gg_Glucose <- gg_Glucose + scale_x_discrete(breaks=c(0:21)*10)
gg_Glucose <- gg_Glucose + theme(axis.text = element_text(size = 18)) + theme(text = element_text(size = 18))
gg_Glucose
# Blood Pressure
df_BP <- data.frame(table(diabetes$BloodPressure))
gg_BP <- ggplot(data=df_BP, mapping=aes(x=df_BP$Var1,y=df_BP$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(47))
gg_BP <- gg_BP + scale_x_discrete(breaks=c(0:13)*10)
gg_BP <- gg_BP + xlab("Blood Pressure") + ylab("Frequency")
gg_BP <- gg_BP + theme(axis.text = element_text(size = 18)) + theme(text = element_text(size = 18))
gg_BP

# Skin Thickness
df_Skin <- data.frame(table(diabetes$SkinThickness)[2:51])
gg_Skin <- ggplot(data=df_Skin, mapping=aes(x=df_Skin$Var1,y=df_Skin$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(50))
gg_Skin <- gg_Skin + scale_x_discrete(breaks=c(0:10)*10)
gg_Skin <- gg_Skin + xlab("Skin Thickness (Ignore 0 ! )") + ylab("Frequency")
gg_Skin <- gg_Skin + theme(axis.text = element_text(size = 18)) + theme(text = element_text(size = 18))
gg_Skin

# Insulin
df_Insulin <- data.frame(table(cut(diabetes$Insulin,breaks=c(0:20)*10)))
gg_Insulin <- ggplot(data=df_Insulin, mapping=aes(x=df_Insulin$Var1,y=df_Insulin$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(20))
gg_Insulin <- gg_Insulin#  + scale_x_discrete(breaks=c(1:5), labels = df_Insulin$Var1[c(1,5,10,15,20)])
gg_Insulin <- gg_Insulin + xlab("Insulin") + ylab("Frequency")
gg_Insulin <- gg_Insulin + theme(axis.text = element_text(size = 8)) + theme(text = element_text(size = 18))
gg_Insulin


# BMI
df_BMI <- data.frame(table(cut(diabetes$BMI,breaks=c(0:20)*4))[4:18])
BMI_X <- c(0:19)*4
gg_BMI <- ggplot(data=df_BMI, mapping=aes(x=df_BMI$Var1,y=df_BMI$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(15))
gg_BMI <- gg_BMI#  + scale_x_discrete(breaks=c(0:7)*10)
gg_BMI <- gg_BMI + xlab("BMI") + ylab("Frequency") # + scale_x_discrete(breaks=df_BMI$Var1, labels = BMI_X)
gg_BMI <- gg_BMI + theme(axis.text = element_text(size = 12)) + theme(text = element_text(size = 18))
gg_BMI

# Diabetes Pedigree Function
df_DiabetesPedigreeFunction <- data.frame(table(cut(diabetes$DiabetesPedigreeFunction,breaks=c(0:10)*0.1)))
gg_DiabetesPedigreeFunction <- ggplot(data=df_DiabetesPedigreeFunction, mapping=aes(x=df_DiabetesPedigreeFunction$Var1,y=df_DiabetesPedigreeFunction$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(10))
gg_DiabetesPedigreeFunction <- gg_DiabetesPedigreeFunction#  + scale_x_discrete(breaks=c(0:10)*0.1)
gg_DiabetesPedigreeFunction <- gg_DiabetesPedigreeFunction + xlab("DiabetesPedigreeFunction") + ylab("Frequency")
gg_DiabetesPedigreeFunction <- gg_DiabetesPedigreeFunction + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
gg_DiabetesPedigreeFunction

# Age
df_Age <- data.frame(table(cut(diabetes$Age,breaks=c(0,20,23,26,29,32,35,38,41,44,47,50,53,56,59,85))))
gg_Age <- ggplot(data=df_Age, mapping=aes(x=df_Age$Var1,y=df_Age$Freq)) + geom_bar(stat='identity',width = 0.9,fill=rainbow(15))
gg_Age <- gg_Age#  + scale_x_discrete(breaks=c(0:10)*100)
gg_Age <- gg_Age + xlab("Age") + ylab("Frequency")
gg_Age <- gg_Age + theme(axis.text = element_text(size = 12)) + theme(text = element_text(size = 18))
gg_Age


ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$Pregnancies)) + geom_boxplot() + ylab("Pregnance") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$Glucose)) + geom_boxplot() + ylab("Glucose") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))

ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$BloodPressure)) + geom_boxplot() + ylab("Blood Pressure") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$SkinThickness)) + geom_boxplot() + ylab("Skin Thickness") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$Insulin)) + geom_boxplot() + ylab("Insulin") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$BMI)) + geom_boxplot() + ylab("BMI") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$DiabetesPedigreeFunction)) + geom_boxplot() + ylab("Diabetes Pedigree Function") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
ggplot(diabetes, aes(group=diabetes$Outcome, y=diabetes$Age)) + geom_boxplot() + ylab("Age") + xlab("Outcome") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))




# MNIST
acc1<-c(accuracy1,accuracy3,accuracy5,accuracy7,accuracy9,accuracy11,accuracy13,accuracy15,accuracy17,accuracy19,accuracy21)
kkkkk<-c(1,3,5,7,9,11,13,15,17,19,21)
AccuracyOnK <- data.frame(x=kkkkk, y=acc1)
acc1_4 <- c(accuracyof4,accuracyof4_3,accuracyof4_5,accuracyof4_7,accuracyof4_9,accuracyof4_11,accuracyof4_13,accuracyof4_15,accuracyof4_17,accuracyof4_19,accuracyof4_21)
g_acc1 <- ggplot(AccuracyOnK, aes(x=AccuracyOnK$x,y=AccuracyOnK$y,color="OJ", shape= "OJ")) + geom_line(size=1) + geom_point(size = 4)
g_acc1


# Run RCode first. 
acc2<-c(accuracy1,accuracy3,accuracy5,accuracy7,accuracy9,accuracy11,accuracy13,accuracy15,accuracy17,accuracy19,accuracy21)
AccuracyOnK_2 <- data.frame(x=kkkkk, y=acc2)
acc2_4 <- c(accuracyof4,accuracyof4_3,accuracyof4_5,accuracyof4_7,accuracyof4_9,accuracyof4_11,accuracyof4_13,accuracyof4_15,accuracyof4_17,accuracyof4_19,accuracyof4_21)
g_acc2<- ggplot(AccuracyOnK_2, aes(x=AccuracyOnK_2$x,y=AccuracyOnK_2$y,color="OJ", shape= "OJ")) + geom_line(size=1) + geom_point(size = 4)
g_acc2

# Run RCode_Power_3 first. 
acc3<-c(accuracy1,accuracy3,accuracy5,accuracy7,accuracy9,accuracy11,accuracy13,accuracy15,accuracy17,accuracy19,accuracy21)
acc3_4 <- c(accuracyof4,accuracyof4_3,accuracyof4_5,accuracyof4_7,accuracyof4_9,accuracyof4_11,accuracyof4_13,accuracyof4_15,accuracyof4_17,accuracyof4_19,accuracyof4_21)
AccuracyOnK_3 <- data.frame(x=kkkkk, y=acc3)
g_acc3<- ggplot(AccuracyOnK_3, aes(x=AccuracyOnK_3$x,y=AccuracyOnK_3$y,color="OJ", shape= "OJ")) + geom_line(size=1) + geom_point(size = 4)
g_acc3


Accuracy_All <- read.table("C:\\Users\\Fantacy\\OneDrive\\Macine Learning\\MNIST\\Accuracy_ALL.csv",header = TRUE, sep=",")
AccuracyOnK_AllDis <- data.frame(Accuracy_All)
Distance = Accuracy_All$Distance
g_ACC <- ggplot(AccuracyOnK_AllDis, aes(x=AccuracyOnK_AllDis$k,y=AccuracyOnK_AllDis$Accuracy,color=Distance,group=Distance,fill=AccuracyOnK_AllDis$Distance)) + geom_line(size=1) + geom_point(size = 4, shape = 22,fill="white")
g_ACC <- g_ACC + ylab("Total Accuracy") + xlab("k") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
g_ACC

Accuracy_4_All <- read.table("C:\\Users\\Fantacy\\OneDrive\\Macine Learning\\MNIST\\Accuracy_4.csv",header = TRUE, sep=",")
Accuracy_4_AllDis <- data.frame(Accuracy_4_All)
g_ACC_4 <- ggplot(Accuracy_4_AllDis, aes(x=Accuracy_4_AllDis$k,y=Accuracy_4_AllDis$Accuracy,color=Distance,group=Distance,fill=Accuracy_4_AllDis$Distance)) + geom_line(size=1) + geom_point(size = 4, shape = 22,fill="white")
g_ACC_4 <- g_ACC_4 + ylab("Accuracy of digit 4") + xlab("k") + theme(axis.text = element_text(size = 15)) + theme(text = element_text(size = 18))
g_ACC_4
