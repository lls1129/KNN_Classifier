Accuracy <- function(matrix){
  correct = 0
  for (i in 1:10) {
    correct = correct + matrix[i,i]
  }
  correct/sum(matrix)
}


labels <- c(0,1,2,3,4,5,6,7,8,9)

# k=1
confusionmatrix1 <- matrix(c(772.0, 0.0, 7.0, 2.0, 2.0, 2.0, 2.0, 0.0, 5.0, 4.0,1.0, 900.0, 5.0, 4.0, 6.0, 0.0, 1.0, 6.0, 13.0, 0.0,0.0, 2.0, 787.0, 9.0, 0.0, 0.0, 0.0, 1.0, 4.0, 0.0,0.0, 1.0, 5.0, 831.0, 0.0, 17.0, 1.0, 2.0, 27.0, 6.0,0.0, 0.0, 0.0, 0.0, 750.0, 2.0, 1.0, 1.0, 3.0, 15.0,1.0, 0.0, 0.0, 15.0, 0.0, 749.0, 5.0, 0.0, 20.0, 3.0,2.0, 0.0, 2.0, 0.0, 3.0, 10.0, 826.0, 0.0, 3.0, 0.0,1.0, 2.0, 17.0, 7.0, 1.0, 0.0, 0.0, 871.0, 2.0, 17.0,0.0, 2.0, 0.0, 7.0, 0.0, 2.0, 0.0, 0.0, 799.0, 1.0,1.0, 1.0, 1.0, 2.0, 19.0, 5.0, 0.0, 8.0, 9.0, 749.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix1) <- labels
colnames(confusionmatrix1) <- labels
confusionmatrix1
correct = 0
for (i in 1:10) {
  print(confusionmatrix1[i,i])
  correct = correct + confusionmatrix1[i,i]
}
accuracy1 <- correct/sum(confusionmatrix1)
accuracyof4 = confusionmatrix1[5,5]/sum(confusionmatrix1[,5])
correct
sum(confusionmatrix1)
accuracy1
accuracyof4

# k=3
confusionmatrix3 <- matrix(c(774.0, 0.0, 9.0, 3.0, 2.0, 2.0, 3.0, 1.0, 3.0, 7.0,1.0, 898.0, 10.0, 3.0, 8.0, 1.0, 3.0, 9.0, 18.0, 1.0,0.0, 3.0, 781.0, 5.0, 0.0, 0.0, 0.0, 0.0, 5.0, 0.0,1.0, 2.0, 2.0, 836.0, 0.0, 10.0, 1.0, 0.0, 28.0, 8.0,0.0, 1.0, 1.0, 0.0, 750.0, 2.0, 0.0, 0.0, 3.0, 9.0,1.0, 0.0, 0.0, 16.0, 0.0, 754.0, 4.0, 0.0, 24.0, 3.0,1.0, 0.0, 1.0, 0.0, 4.0, 11.0, 825.0, 0.0, 3.0, 0.0,0.0, 3.0, 17.0, 7.0, 1.0, 0.0, 0.0, 869.0, 1.0, 14.0,0.0, 0.0, 2.0, 5.0, 0.0, 0.0, 0.0, 0.0, 792.0, 1.0,0.0, 1.0, 1.0, 2.0, 16.0, 7.0, 0.0, 10.0, 8.0, 752.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix3) <- labels
colnames(confusionmatrix3) <- labels
confusionmatrix3
correct3 = 0
for (i in 1:10) {
  print(confusionmatrix3[i,i])
  correct3 = correct3 + confusionmatrix3[i,i]
}
accuracy3 <- correct3/sum(confusionmatrix3)
accuracyof4_3 = confusionmatrix3[5,5]/sum(confusionmatrix3[,5])
correct3
sum(confusionmatrix3)
accuracy3
accuracyof4_3

# k=5
confusionmatrix5 <- matrix(c(771.0, 0.0, 9.0, 4.0, 1.0, 2.0, 3.0, 1.0, 2.0, 7.0,1.0, 900.0, 12.0, 6.0, 10.0, 3.0, 3.0, 11.0, 19.0, 2.0,1.0, 4.0, 778.0, 6.0, 0.0, 0.0, 0.0, 0.0, 4.0, 0.0,1.0, 0.0, 3.0, 832.0, 0.0, 10.0, 0.0, 0.0, 24.0, 9.0,0.0, 1.0, 1.0, 0.0, 747.0, 1.0, 0.0, 1.0, 4.0, 6.0,1.0, 0.0, 0.0, 12.0, 0.0, 750.0, 4.0, 0.0, 27.0, 2.0,2.0, 0.0, 0.0, 1.0, 4.0, 11.0, 826.0, 0.0, 5.0, 0.0,0.0, 2.0, 19.0, 8.0, 2.0, 0.0, 0.0, 866.0, 2.0, 20.0,0.0, 0.0, 2.0, 4.0, 0.0, 0.0, 0.0, 0.0, 788.0, 1.0,1.0, 1.0, 0.0, 4.0, 17.0, 10.0, 0.0, 10.0, 10.0, 748.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix5) <- labels
colnames(confusionmatrix5) <- labels
confusionmatrix5
correct5 = 0
for (i in 1:10) {
  print(confusionmatrix5[i,i])
  correct5 = correct5 + confusionmatrix5[i,i]
}
accuracy5 <- correct5/sum(confusionmatrix5)
accuracyof4_5 = confusionmatrix5[5,5]/sum(confusionmatrix5[,5])
correct5
sum(confusionmatrix5)
accuracy5
accuracyof4_5

# k=7
confusionmatrix7 <- matrix(c(772.0, 0.0, 11.0, 3.0, 1.0, 2.0, 4.0, 1.0, 2.0, 7.0,1.0, 900.0, 18.0, 8.0, 11.0, 3.0, 3.0, 15.0, 22.0, 2.0,0.0, 4.0, 768.0, 5.0, 0.0, 0.0, 0.0, 0.0, 4.0, 1.0,1.0, 0.0, 4.0, 835.0, 0.0, 9.0, 0.0, 0.0, 26.0, 11.0,0.0, 1.0, 0.0, 0.0, 747.0, 2.0, 0.0, 0.0, 5.0, 3.0,2.0, 0.0, 0.0, 10.0, 0.0, 755.0, 4.0, 0.0, 24.0, 2.0,2.0, 0.0, 0.0, 1.0, 4.0, 8.0, 825.0, 0.0, 6.0, 0.0,0.0, 2.0, 20.0, 8.0, 3.0, 0.0, 0.0, 862.0, 3.0, 21.0,0.0, 0.0, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 787.0, 0.0,0.0, 1.0, 0.0, 3.0, 15.0, 8.0, 0.0, 11.0, 6.0, 748.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix7) <- labels
colnames(confusionmatrix7) <- labels
confusionmatrix7
correct7 = 0
for (i in 1:10) {
  print(confusionmatrix7[i,i])
  correct7 = correct7 + confusionmatrix7[i,i]
}
accuracy7 <- correct7/sum(confusionmatrix7)
accuracyof4_7 = confusionmatrix7[5,5]/sum(confusionmatrix7[,5])
correct7
sum(confusionmatrix7)
accuracy7
accuracyof4_7

# k=9
confusionmatrix9 <- matrix(c(771.0, 0.0, 10.0, 3.0, 1.0, 2.0, 4.0, 1.0, 2.0, 7.0,1.0, 900.0, 19.0, 9.0, 10.0, 5.0, 4.0, 17.0, 22.0, 3.0,0.0, 3.0, 764.0, 5.0, 0.0, 0.0, 0.0, 0.0, 5.0, 0.0,0.0, 2.0, 5.0, 832.0, 0.0, 7.0, 0.0, 0.0, 28.0, 12.0,0.0, 1.0, 1.0, 0.0, 743.0, 3.0, 0.0, 0.0, 3.0, 4.0,2.0, 0.0, 1.0, 13.0, 0.0, 755.0, 5.0, 0.0, 25.0, 2.0,3.0, 0.0, 1.0, 0.0, 4.0, 8.0, 823.0, 0.0, 5.0, 0.0,0.0, 2.0, 20.0, 8.0, 2.0, 0.0, 0.0, 859.0, 3.0, 22.0,0.0, 0.0, 3.0, 4.0, 0.0, 0.0, 0.0, 0.0, 782.0, 0.0,1.0, 0.0, 0.0, 3.0, 21.0, 7.0, 0.0, 12.0, 10.0, 745.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix9) <- labels
colnames(confusionmatrix9) <- labels
confusionmatrix9
correct9 = 0
for (i in 1:10) {
  print(confusionmatrix9[i,i])
  correct9 = correct9 + confusionmatrix9[i,i]
}
accuracy9 <- correct9/sum(confusionmatrix9)
accuracyof4_9 = confusionmatrix9[5,5]/sum(confusionmatrix9[,5])
correct9
sum(confusionmatrix9)
accuracy9
accuracyof4_9

# k=11
confusionmatrix11 <- matrix(c(770.0, 0.0, 11.0, 3.0, 2.0, 2.0, 3.0, 1.0, 1.0, 7.0,1.0, 900.0, 19.0, 12.0, 10.0, 5.0, 4.0, 16.0, 25.0, 4.0,1.0, 3.0, 764.0, 4.0, 0.0, 0.0, 0.0, 0.0, 5.0, 1.0,0.0, 2.0, 6.0, 830.0, 0.0, 8.0, 0.0, 0.0, 27.0, 12.0,0.0, 1.0, 1.0, 0.0, 739.0, 2.0, 0.0, 0.0, 3.0, 3.0,2.0, 0.0, 1.0, 13.0, 0.0, 753.0, 4.0, 0.0, 21.0, 2.0,4.0, 0.0, 1.0, 0.0, 4.0, 10.0, 825.0, 0.0, 6.0, 0.0,0.0, 2.0, 19.0, 9.0, 3.0, 0.0, 0.0, 860.0, 3.0, 20.0,0.0, 0.0, 2.0, 4.0, 0.0, 0.0, 0.0, 0.0, 781.0, 0.0,0.0, 0.0, 0.0, 2.0, 23.0, 7.0, 0.0, 12.0, 13.0, 746.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix11) <- labels
colnames(confusionmatrix11) <- labels
confusionmatrix11
correct11 = 0
for (i in 1:10) {
  print(confusionmatrix11[i,i])
  correct11 = correct11 + confusionmatrix11[i,i]
}
accuracy11 <- correct11/sum(confusionmatrix11)
accuracyof4_11 = confusionmatrix11[5,5]/sum(confusionmatrix11[,5])
correct11
sum(confusionmatrix11)
accuracy11
accuracyof4_11

# k=13
confusionmatrix13 <- matrix(c(770.0, 0.0, 12.0, 3.0, 2.0, 3.0, 4.0, 1.0, 3.0, 7.0,1.0, 900.0, 21.0, 12.0, 11.0, 7.0, 4.0, 17.0, 24.0, 4.0,1.0, 3.0, 763.0, 4.0, 0.0, 0.0, 0.0, 0.0, 5.0, 1.0,0.0, 1.0, 3.0, 828.0, 0.0, 10.0, 0.0, 0.0, 25.0, 12.0,0.0, 2.0, 1.0, 0.0, 739.0, 2.0, 0.0, 0.0, 4.0, 5.0,2.0, 0.0, 0.0, 13.0, 0.0, 746.0, 4.0, 0.0, 21.0, 2.0,4.0, 0.0, 1.0, 0.0, 4.0, 11.0, 824.0, 0.0, 6.0, 0.0,0.0, 2.0, 21.0, 10.0, 3.0, 1.0, 0.0, 860.0, 3.0, 19.0,0.0, 0.0, 2.0, 5.0, 0.0, 0.0, 0.0, 0.0, 779.0, 0.0,0.0, 0.0, 0.0, 2.0, 22.0, 7.0, 0.0, 11.0, 15.0, 745.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix13) <- labels
colnames(confusionmatrix13) <- labels
confusionmatrix13
correct13 = 0
for (i in 1:10) {
  print(confusionmatrix13[i,i])
  correct13 = correct13 + confusionmatrix13[i,i]
}
accuracy13 <- correct13/sum(confusionmatrix13)
accuracyof4_13 = confusionmatrix13[5,5]/sum(confusionmatrix13[,5])
correct13
sum(confusionmatrix13)
accuracy13
accuracyof4_13

# k=15
confusionmatrix15 <- matrix(c(771.0, 0.0, 11.0, 3.0, 2.0, 3.0, 2.0, 1.0, 3.0, 8.0,1.0, 900.0, 24.0, 12.0, 11.0, 7.0, 5.0, 19.0, 27.0, 4.0,0.0, 3.0, 759.0, 4.0, 0.0, 0.0, 0.0, 0.0, 5.0, 1.0,0.0, 1.0, 5.0, 827.0, 0.0, 7.0, 0.0, 0.0, 27.0, 12.0,0.0, 2.0, 1.0, 0.0, 740.0, 2.0, 0.0, 1.0, 5.0, 3.0,2.0, 0.0, 0.0, 12.0, 0.0, 749.0, 4.0, 0.0, 20.0, 2.0,4.0, 0.0, 1.0, 0.0, 4.0, 11.0, 825.0, 0.0, 6.0, 0.0,0.0, 2.0, 20.0, 10.0, 4.0, 0.0, 0.0, 856.0, 3.0, 20.0,0.0, 0.0, 3.0, 5.0, 0.0, 0.0, 0.0, 0.0, 772.0, 0.0,0.0, 0.0, 0.0, 4.0, 20.0, 8.0, 0.0, 12.0, 17.0, 745.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix15) <- labels
colnames(confusionmatrix15) <- labels
confusionmatrix15
correct15 = 0
for (i in 1:10) {
  print(confusionmatrix15[i,i])
  correct15 = correct15 + confusionmatrix15[i,i]
}
accuracy15 <- correct15/sum(confusionmatrix15)
accuracyof4_15 = confusionmatrix15[5,5]/sum(confusionmatrix15[,5])
correct15
sum(confusionmatrix15)
accuracy15
accuracyof4_15

# k=17
confusionmatrix17 <- matrix(c(771.0, 0.0, 10.0, 2.0, 2.0, 3.0, 3.0, 1.0, 2.0, 8.0,1.0, 900.0, 29.0, 13.0, 15.0, 7.0, 5.0, 22.0, 29.0, 4.0,0.0, 3.0, 751.0, 4.0, 0.0, 0.0, 0.0, 0.0, 6.0, 1.0,0.0, 1.0, 6.0, 828.0, 0.0, 9.0, 0.0, 0.0, 26.0, 11.0,0.0, 2.0, 2.0, 0.0, 734.0, 3.0, 0.0, 1.0, 6.0, 4.0,2.0, 0.0, 0.0, 13.0, 0.0, 748.0, 4.0, 0.0, 21.0, 2.0,4.0, 0.0, 1.0, 0.0, 4.0, 10.0, 824.0, 0.0, 5.0, 0.0,0.0, 2.0, 22.0, 9.0, 4.0, 1.0, 0.0, 853.0, 3.0, 19.0,0.0, 0.0, 3.0, 5.0, 0.0, 0.0, 0.0, 0.0, 772.0, 1.0,0.0, 0.0, 0.0, 3.0, 22.0, 6.0, 0.0, 12.0, 15.0, 745.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix17) <- labels
colnames(confusionmatrix17) <- labels
confusionmatrix17
correct17 = 0
for (i in 1:10) {
  print(confusionmatrix17[i,i])
  correct17 = correct17 + confusionmatrix17[i,i]
}
accuracy17 <- correct17/sum(confusionmatrix17)
accuracyof4_17 = confusionmatrix17[5,5]/sum(confusionmatrix17[,5])
correct17
sum(confusionmatrix17)
accuracy17
accuracyof4_17

# k=19
confusionmatrix19 <- matrix(c(771.0, 0.0, 11.0, 2.0, 2.0, 2.0, 3.0, 1.0, 1.0, 8.0,1.0, 900.0, 33.0, 14.0, 15.0, 10.0, 5.0, 25.0, 28.0, 4.0,0.0, 3.0, 743.0, 3.0, 0.0, 0.0, 0.0, 0.0, 6.0, 1.0,0.0, 1.0, 5.0, 826.0, 0.0, 8.0, 0.0, 0.0, 27.0, 13.0,0.0, 2.0, 2.0, 0.0, 733.0, 2.0, 0.0, 1.0, 6.0, 6.0,2.0, 0.0, 1.0, 12.0, 0.0, 748.0, 4.0, 0.0, 22.0, 2.0,4.0, 0.0, 2.0, 0.0, 5.0, 10.0, 824.0, 0.0, 7.0, 0.0,0.0, 2.0, 24.0, 10.0, 4.0, 0.0, 0.0, 851.0, 3.0, 19.0,0.0, 0.0, 3.0, 5.0, 0.0, 0.0, 0.0, 0.0, 769.0, 1.0,0.0, 0.0, 0.0, 5.0, 22.0, 7.0, 0.0, 11.0, 16.0, 741.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix19) <- labels
colnames(confusionmatrix19) <- labels
confusionmatrix19
correct19 = 0
for (i in 1:10) {
  print(confusionmatrix19[i,i])
  correct19 = correct19 + confusionmatrix19[i,i]
}
accuracy19 <- correct19/sum(confusionmatrix19)
accuracyof4_19 = confusionmatrix19[5,5]/sum(confusionmatrix19[,5])
correct19
sum(confusionmatrix19)
accuracy19
accuracyof4_19

# k=21
confusionmatrix21 <- matrix(c(771.0, 0.0, 11.0, 2.0, 2.0, 3.0, 3.0, 1.0, 2.0, 8.0,1.0, 900.0, 35.0, 15.0, 17.0, 11.0, 5.0, 23.0, 29.0, 5.0,0.0, 3.0, 739.0, 3.0, 0.0, 0.0, 0.0, 0.0, 6.0, 1.0,0.0, 1.0, 5.0, 825.0, 0.0, 8.0, 0.0, 0.0, 28.0, 12.0,1.0, 2.0, 4.0, 0.0, 730.0, 2.0, 0.0, 1.0, 5.0, 5.0,2.0, 0.0, 1.0, 12.0, 0.0, 746.0, 4.0, 0.0, 22.0, 2.0,3.0, 0.0, 1.0, 0.0, 5.0, 10.0, 824.0, 0.0, 7.0, 0.0,0.0, 2.0, 25.0, 11.0, 4.0, 0.0, 0.0, 853.0, 3.0, 20.0,0.0, 0.0, 3.0, 5.0, 0.0, 0.0, 0.0, 0.0, 766.0, 1.0,0.0, 0.0, 0.0, 4.0, 23.0, 7.0, 0.0, 11.0, 17.0, 741.0), nrow = 10, ncol = 10, byrow=TRUE)
rownames(confusionmatrix21) <- labels
colnames(confusionmatrix21) <- labels
confusionmatrix21
correct21 = 0
for (i in 1:10) {
  print(confusionmatrix21[i,i])
  correct21 = correct21 + confusionmatrix21[i,i]
}
accuracy21 <- correct21/sum(confusionmatrix21)
accuracyof4_21 = confusionmatrix21[5,5]/sum(confusionmatrix21[,5])
correct21
sum(confusionmatrix21)
accuracy21
accuracyof4_21


