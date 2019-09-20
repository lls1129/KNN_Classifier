Accuracy <- function(matrix){
  correct = 0
  for (i in 1:10) {
    correct = correct + matrix[i,i]
  }
  correct/sum(matrix)
}


labels <- c(0,1,2,3,4,5,6,7,8,9)

# k=1
confusionmatrix1 <- matrix(c(819.0, 0.0, 4.0, 3.0, 1.0, 1.0, 4.0, 0.0, 4.0, 3.0, 1.0, 904.0, 6.0, 1.0, 6.0, 0.0, 0.0, 9.0, 4.0, 1.0, 0.0, 3.0, 749.0, 6.0, 0.0, 0.0, 0.0, 2.0, 5.0, 1.0, 0.0, 0.0, 3.0, 845.0, 0.0, 12.0, 0.0, 1.0, 16.0, 5.0, 0.0, 1.0, 0.0, 0.0, 805.0, 2.0, 0.0, 3.0, 3.0, 10.0, 3.0, 0.0, 1.0, 10.0, 2.0, 724.0, 9.0, 0.0, 14.0, 1.0, 3.0, 2.0, 2.0, 0.0, 0.0, 14.0, 817.0, 0.0, 6.0, 0.0, 0.0, 2.0, 10.0, 4.0, 2.0, 1.0, 0.0, 831.0, 1.0, 8.0, 0.0, 3.0, 0.0, 10.0, 0.0, 2.0, 0.0, 0.0, 708.0, 0.0, 0.0, 0.0, 1.0, 5.0, 17.0, 5.0, 0.0, 9.0, 7.0, 803.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix3 <- matrix(c(819.0, 0.0, 5.0, 3.0, 2.0, 2.0, 7.0, 1.0, 3.0, 2.0,1.0, 904.0, 7.0, 1.0, 7.0, 1.0, 0.0, 11.0, 7.0, 1.0,0.0, 3.0, 744.0, 8.0, 0.0, 0.0, 0.0, 2.0, 3.0, 0.0,0.0, 0.0, 2.0, 847.0, 0.0, 13.0, 0.0, 0.0, 19.0, 6.0,0.0, 1.0, 0.0, 0.0, 804.0, 2.0, 1.0, 3.0, 3.0, 6.0,3.0, 0.0, 1.0, 9.0, 0.0, 722.0, 5.0, 0.0, 14.0, 0.0,3.0, 2.0, 1.0, 1.0, 1.0, 10.0, 817.0, 0.0, 6.0, 0.0,0.0, 4.0, 15.0, 5.0, 1.0, 2.0, 0.0, 833.0, 3.0, 6.0,0.0, 1.0, 1.0, 6.0, 0.0, 3.0, 0.0, 0.0, 706.0, 1.0,0.0, 0.0, 0.0, 4.0, 18.0, 6.0, 0.0, 5.0, 4.0, 810.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix5 <- matrix(c(818.0, 0.0, 6.0, 2.0, 1.0, 1.0, 4.0, 1.0, 1.0, 3.0,1.0, 905.0, 8.0, 1.0, 9.0, 0.0, 0.0, 15.0, 8.0, 2.0,0.0, 2.0, 741.0, 7.0, 0.0, 0.0, 0.0, 2.0, 3.0, 0.0,0.0, 0.0, 1.0, 852.0, 0.0, 12.0, 0.0, 0.0, 12.0, 6.0,0.0, 1.0, 0.0, 0.0, 798.0, 1.0, 0.0, 2.0, 2.0, 6.0,3.0, 0.0, 1.0, 11.0, 0.0, 723.0, 5.0, 0.0, 15.0, 2.0,3.0, 2.0, 1.0, 1.0, 1.0, 14.0, 820.0, 0.0, 8.0, 0.0,0.0, 4.0, 16.0, 4.0, 1.0, 2.0, 0.0, 829.0, 0.0, 6.0,0.0, 1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 0.0, 710.0, 2.0,1.0, 0.0, 1.0, 3.0, 23.0, 4.0, 0.0, 6.0, 9.0, 805.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix7 <- matrix(c(817.0, 0.0, 5.0, 2.0, 1.0, 1.0, 4.0, 1.0, 3.0, 3.0,1.0, 905.0, 8.0, 5.0, 8.0, 1.0, 0.0, 18.0, 10.0, 2.0,0.0, 2.0, 742.0, 5.0, 0.0, 0.0, 1.0, 1.0, 2.0, 0.0,0.0, 0.0, 1.0, 845.0, 0.0, 14.0, 0.0, 0.0, 17.0, 3.0,0.0, 1.0, 0.0, 0.0, 802.0, 1.0, 0.0, 0.0, 2.0, 6.0,3.0, 0.0, 1.0, 14.0, 0.0, 716.0, 6.0, 0.0, 12.0, 1.0,3.0, 2.0, 1.0, 1.0, 0.0, 15.0, 818.0, 0.0, 7.0, 0.0,0.0, 4.0, 17.0, 5.0, 1.0, 3.0, 0.0, 830.0, 0.0, 7.0,0.0, 1.0, 1.0, 4.0, 0.0, 3.0, 1.0, 0.0, 706.0, 2.0,2.0, 0.0, 0.0, 3.0, 21.0, 7.0, 0.0, 5.0, 9.0, 808.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix9 <- matrix(c(819.0, 0.0, 6.0, 2.0, 1.0, 1.0, 4.0, 1.0, 3.0, 3.0,1.0, 905.0, 12.0, 5.0, 9.0, 1.0, 1.0, 20.0, 9.0, 1.0,0.0, 2.0, 738.0, 5.0, 0.0, 0.0, 0.0, 1.0, 2.0, 0.0,1.0, 0.0, 1.0, 847.0, 0.0, 13.0, 0.0, 0.0, 16.0, 4.0,0.0, 1.0, 0.0, 0.0, 798.0, 1.0, 0.0, 0.0, 5.0, 7.0,2.0, 0.0, 1.0, 12.0, 0.0, 716.0, 6.0, 0.0, 12.0, 1.0,2.0, 1.0, 1.0, 1.0, 0.0, 17.0, 818.0, 0.0, 8.0, 0.0,0.0, 4.0, 15.0, 5.0, 1.0, 2.0, 0.0, 829.0, 0.0, 9.0,0.0, 1.0, 1.0, 4.0, 0.0, 3.0, 1.0, 0.0, 705.0, 1.0,1.0, 1.0, 1.0, 3.0, 24.0, 7.0, 0.0, 4.0, 8.0, 806.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix11 <- matrix(c(819.0, 0.0, 5.0, 2.0, 2.0, 2.0, 4.0, 0.0, 4.0, 3.0,1.0, 906.0, 12.0, 5.0, 10.0, 1.0, 1.0, 21.0, 10.0, 1.0,0.0, 2.0, 736.0, 5.0, 0.0, 0.0, 1.0, 1.0, 2.0, 0.0,1.0, 0.0, 1.0, 844.0, 0.0, 10.0, 0.0, 0.0, 16.0, 5.0,0.0, 1.0, 0.0, 0.0, 795.0, 0.0, 0.0, 2.0, 4.0, 5.0,2.0, 0.0, 1.0, 13.0, 0.0, 720.0, 5.0, 0.0, 10.0, 0.0,2.0, 1.0, 1.0, 1.0, 1.0, 16.0, 818.0, 0.0, 7.0, 0.0,0.0, 4.0, 17.0, 4.0, 1.0, 1.0, 0.0, 827.0, 1.0, 8.0,0.0, 1.0, 1.0, 5.0, 0.0, 2.0, 1.0, 0.0, 705.0, 1.0,1.0, 0.0, 2.0, 5.0, 24.0, 9.0, 0.0, 4.0, 9.0, 809.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix13 <- matrix(c(818.0, 0.0, 6.0, 2.0, 2.0, 2.0, 4.0, 1.0, 4.0, 3.0,1.0, 905.0, 17.0, 5.0, 9.0, 1.0, 0.0, 25.0, 10.0, 2.0,0.0, 2.0, 728.0, 4.0, 0.0, 0.0, 1.0, 0.0, 3.0, 0.0,1.0, 0.0, 1.0, 843.0, 0.0, 12.0, 0.0, 0.0, 13.0, 5.0,0.0, 2.0, 0.0, 0.0, 791.0, 1.0, 0.0, 0.0, 4.0, 5.0,3.0, 0.0, 1.0, 14.0, 0.0, 717.0, 5.0, 0.0, 12.0, 0.0,2.0, 1.0, 2.0, 1.0, 1.0, 16.0, 819.0, 0.0, 7.0, 0.0,0.0, 4.0, 18.0, 6.0, 1.0, 0.0, 0.0, 824.0, 1.0, 8.0,0.0, 1.0, 1.0, 3.0, 0.0, 4.0, 1.0, 0.0, 704.0, 2.0,1.0, 0.0, 2.0, 6.0, 29.0, 8.0, 0.0, 5.0, 10.0, 807.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix15 <- matrix(c(818.0, 0.0, 6.0, 2.0, 2.0, 2.0, 7.0, 1.0, 4.0, 3.0,1.0, 905.0, 17.0, 5.0, 10.0, 2.0, 1.0, 25.0, 11.0, 3.0,0.0, 2.0, 729.0, 5.0, 0.0, 0.0, 0.0, 0.0, 3.0, 1.0,1.0, 0.0, 2.0, 840.0, 0.0, 12.0, 0.0, 0.0, 15.0, 7.0,0.0, 2.0, 0.0, 0.0, 791.0, 1.0, 0.0, 0.0, 4.0, 5.0,3.0, 0.0, 1.0, 14.0, 0.0, 716.0, 5.0, 0.0, 11.0, 0.0,2.0, 1.0, 1.0, 2.0, 1.0, 16.0, 816.0, 0.0, 7.0, 0.0,0.0, 4.0, 16.0, 5.0, 1.0, 1.0, 0.0, 823.0, 1.0, 7.0,0.0, 1.0, 1.0, 5.0, 0.0, 3.0, 1.0, 0.0, 703.0, 2.0,1.0, 0.0, 3.0, 6.0, 28.0, 8.0, 0.0, 6.0, 9.0, 804.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix17 <- matrix(c(818.0, 0.0, 6.0, 2.0, 2.0, 2.0, 10.0, 1.0, 4.0, 3.0,1.0, 904.0, 20.0, 5.0, 9.0, 2.0, 1.0, 28.0, 13.0, 3.0,0.0, 2.0, 725.0, 6.0, 0.0, 0.0, 0.0, 0.0, 3.0, 0.0,1.0, 0.0, 2.0, 839.0, 0.0, 12.0, 0.0, 0.0, 14.0, 5.0,0.0, 3.0, 0.0, 0.0, 791.0, 1.0, 0.0, 1.0, 4.0, 5.0,3.0, 0.0, 1.0, 13.0, 0.0, 715.0, 3.0, 0.0, 12.0, 1.0,2.0, 1.0, 1.0, 2.0, 1.0, 16.0, 815.0, 0.0, 8.0, 0.0,0.0, 4.0, 17.0, 5.0, 1.0, 1.0, 0.0, 819.0, 1.0, 7.0,0.0, 1.0, 1.0, 6.0, 0.0, 2.0, 1.0, 0.0, 699.0, 2.0,1.0, 0.0, 3.0, 6.0, 29.0, 10.0, 0.0, 6.0, 10.0, 806.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix19 <- matrix(c(818.0, 0.0, 6.0, 2.0, 2.0, 2.0, 9.0, 0.0, 5.0, 3.0,1.0, 904.0, 19.0, 5.0, 10.0, 2.0, 1.0, 28.0, 13.0, 3.0,0.0, 2.0, 726.0, 6.0, 0.0, 0.0, 0.0, 0.0, 3.0, 0.0,1.0, 0.0, 2.0, 836.0, 0.0, 13.0, 0.0, 0.0, 14.0, 7.0,0.0, 3.0, 0.0, 0.0, 787.0, 1.0, 0.0, 3.0, 4.0, 5.0,3.0, 0.0, 1.0, 15.0, 0.0, 713.0, 4.0, 0.0, 14.0, 0.0,2.0, 1.0, 1.0, 2.0, 1.0, 15.0, 815.0, 0.0, 7.0, 0.0,0.0, 4.0, 17.0, 6.0, 3.0, 2.0, 0.0, 817.0, 1.0, 7.0,0.0, 1.0, 1.0, 6.0, 0.0, 3.0, 1.0, 0.0, 696.0, 2.0,1.0, 0.0, 3.0, 6.0, 30.0, 10.0, 0.0, 7.0, 11.0, 805.0), nrow = 10, ncol = 10, byrow=TRUE)
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
confusionmatrix21 <- matrix(c(818.0, 0.0, 5.0, 2.0, 2.0, 2.0, 10.0, 0.0, 5.0, 4.0,1.0, 905.0, 20.0, 8.0, 12.0, 3.0, 2.0, 29.0, 13.0, 3.0,0.0, 2.0, 722.0, 5.0, 0.0, 0.0, 0.0, 0.0, 2.0, 0.0,1.0, 0.0, 3.0, 836.0, 0.0, 14.0, 0.0, 0.0, 15.0, 5.0,0.0, 3.0, 0.0, 0.0, 783.0, 1.0, 0.0, 2.0, 4.0, 5.0,3.0, 0.0, 2.0, 14.0, 0.0, 712.0, 3.0, 0.0, 14.0, 0.0,2.0, 0.0, 2.0, 2.0, 1.0, 14.0, 814.0, 0.0, 8.0, 0.0,0.0, 4.0, 18.0, 5.0, 3.0, 2.0, 0.0, 818.0, 1.0, 9.0,0.0, 1.0, 1.0, 6.0, 0.0, 3.0, 1.0, 0.0, 696.0, 2.0,1.0, 0.0, 3.0, 6.0, 32.0, 10.0, 0.0, 6.0, 10.0, 804.0), nrow = 10, ncol = 10, byrow=TRUE)
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


