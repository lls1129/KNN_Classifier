# KNN implement by Linsheng Liu
# Read the kaggle data
# To run this, python2.7 is required!!!!!
# Again!!! 2.7!!!!!!!!
import csv
import random
import math
import time

def loadDataset(filename, split, trainingSet=[], testSet=[]):
    with open(filename, 'rb') as csvfile:
        lines = csv.reader(csvfile)
        dataset = list(lines)
        dataset = dataset[1:len(dataset)]

        # Pre-process data
        for x in range(len(dataset)):
            for y in range(len(dataset[x])-1):
                dataset[x][y] = float(dataset[x][y])
        Generalize(dataset)
            # first line is header.
            # x = x + 1
        for x in range(len(dataset)):
            # for y in range(len(dataset[x])-1):
                # dataset[x][y] = float(dataset[x][y])
            if random.random() < split:
                trainingSet.append(dataset[x])
            else:
                testSet.append(dataset[x])

# Generalizing the data by normalizing and rescalling the data:
def Normalize(array):
    if len(array)==0:
        return 0
    mean=sum(array)/len(array)*1.0
    var=0
    for x in array:
        var+=(x-mean)*(x-mean)
    sd=math.sqrt(var/len(array))
    # print repr(sd)
    for i in range(len(array)):
        array[i]=(array[i]-mean)/sd
    return array

def ScaleToUnit(array):
    zero=[0.]*len(array);
    # change to any distances needed.
    norm=pow(MinkowskiDistance(zero,array,len(array),power),1./power)
    for i in range(len(array)):
        array[i]=array[i]/norm
    return array

def Rescalling(array):
    Min=min(array)*1.0
    Max=max(array)*1.0
    for i in range(len(array)):
        array[i]=(array[i]-Min)/(Max-Min)
    return array
'''
def Generalize(data):
    NumberOfInstances=len(data)
    NumberOfVariables=len(data[1])
    for i in range(NumberOfVariables-1):
        temp=[x[i] for x in data]
        # print temp
        # print 'The ' + i +'th variable is: ' + repr(temp)
        temp=Normalize(ScaleToUnit(Rescalling(temp)))
        # print 'temp: ' + repr(temp)
        for j in range(NumberOfInstances):
            data[j][i]=temp[j]
    return data
'''
def Generalize(data):
    NumberOfInstances=len(data)
    NumberOfVariables=len(data[1])
    for i in range(NumberOfVariables-1):
        temp=[x[i] for x in data]
        # print temp
        # print 'The ' + i +'th variable is: ' + repr(temp)
        temp=Normalize(Rescalling(temp))
        # print 'temp: ' + repr(temp)
        for j in range(NumberOfInstances):
            data[j][i]=temp[j]
    for i in range(NumberOfInstances):
        temp=data[i][0:NumberOfVariables - 1]
        temp=ScaleToUnit(temp)
        for j in range(NumberOfVariables - 1):
            data[i][j] = temp[j]
    return data


# Minkowski distance
def MinkowskiDistance(instance1, instance2, dimension, power):
    distance = 0
    for x in range(dimension):
        distance += pow(abs(instance1[x] - instance2[x]), power)
        # print 'for x = ' + repr(x) + ', the inside sum is right now: ' + repr(distance)
    # return math.pow(distance, 1./power)
    return distance # Just for compare here.
def EuclideanDistance(instance1, instance2, dimension):
    # return MinkowskiDistance(instance1, instance2, dimension, 2.)
    return MinkowskiDistance(instance1, instance2, dimension, 2) # Just for compare here.

# test the distance with power of 2, which is Euclidean distance.
# data1 = [2,2,2,'a']
# data2 = [4,4,4,'b']
# data3 = [3,6,9,'c']
# length = len(data1) - 1
# print 'The Euclidean distance of 1 and 2 is: ' + repr(MinkowskiDistance(data1, data2, length, 2))
# print 'The Euclidean distance of 2 and 3 is: ' + repr(MinkowskiDistance(data2, data3, length, 2))

# Effecient algorithm to use merge sort to get the k most close neighbors.
def Merge(a, b, result, k):
    if k > len(a) + len(b):
        k = len(a) + len(b)
    if len(a) == 0:
        for x in range(k):
            result.append(b[x])
        return result
    if len(b) == 0:
        for x in range(k):
            result.append(a[x])
        return result
    while k > 1:
        if a[0] > b[0]:
            bb = b[1:len(b)]
            result.append(b[0])
            return Merge(a, bb, result, k-1)
        if a[0] <= b[0]:
            aa = a[1:len(a)]
            result.append(a[0])
            return Merge(aa, b, result, k-1)
    if k == 1:
        result.append(min(a[0],b[0]))
        return result

def MergeSortFirstKSmall(unsorted,k):
    length = len(unsorted)
    while length > 1:
        if length >= 2 * k:
            sorted1 = MergeSortFirstKSmall(unsorted[0:length/2],k)
            sorted2 = MergeSortFirstKSmall(unsorted[length/2:length],k)
            result = []
            Merge(sorted1, sorted2, result, k)
            return result
        else:
            sorted1 = MergeSortFirstKSmall(unsorted[0:length/2],length/2)
            sorted2 = MergeSortFirstKSmall(unsorted[length/2:length],length-length/2)
            result = []
            Merge(sorted1, sorted2, result, length)
            return result
    return unsorted

def GetNeighbor(trainingSet,instance,k):
    distances = []
    for x in trainingSet:
        distances.append([MinkowskiDistance(x,instance,len(instance)-1,power),x[-1]])
    #     distances.append([EuclideanDistance(x,instance,len(instance)-1),x[-1]])
    return MergeSortFirstKSmall(distances,k)

def GetLabel(trainingSet,instance,k):
    neighbors = GetNeighbor(trainingSet,instance,k)
    count = 0
    for x in neighbors:
        if x[-1] == '0':
            count = count + 1.
    return (2 * count) < k
    # return (count/(1-0.349))<k

def UpdateLabel(instance,score):
    if score == 0:
        instance[-1] = '0'
    else:
        instance[-1] = '1'

def GetPrediction(trainingSet,instance,k):
    if GetLabel(trainingSet,instance,k) == 1:
        return '1'
    else:
        return '0'

def Test(trainingSet,instance,k):
    UpdateLabel(instance, GetLabel(trainingSet, instance, k))
    # If unsupervised knn, update trainingSet each time.
    trainingSet.append(instance)


power = 3

k=1
while k<22:
    FalseButActuallyTrue = 0.
    TrueButActuallyFalse = 0.
    TrueAndTrue = 0.1
    FalseAndFalse = 0.1


    # acc = 0.
    # truepositive=0.
    for t in range(30):
        # load the data. Pre-process is with loading.
        trainingSet=[]
        testSet=[]
        loadDataset('diabetes.csv',0.7,trainingSet,testSet)



        # for i in range(10):
        #     print testSet[i]

        # Test the result of loading data
        # print 'Train: ' + repr(len(trainingSet))
        # print 'Test: ' + repr(len(testSet))
        # print 'First Train: ' + repr(trainingSet[1])

        # Test the sorting.
        # a = [[3,1],[1,1],[4,0],[76,1],[13,1],[-3,0],[-53,3],[-53,1],[4,0],[-5,0],[34,1],[23,0],[-23,1],[-23,1],[-2,0],[34,0],[43,1]]
        # print repr(MergeSortFirstKSmall(a,7))
        # print repr(a[-1])

        # print repr(GetNeighbor(trainingSet,testSet[1],7))
        # print 'Testdata = ' + repr(testSet[1])
        # print repr(GetLabel(trainingSet,testSet[1],7)*10)
        # UpdateLabel(testSet[1],GetLabel(trainingSet,testSet[1],7))
        # trainingSet.append(testSet[1])
        # print 'New added to training' + repr(trainingSet[-1])

        # Now let's test the KNN

#        k=2*t+3
        # k=21
#        k=7
        # print 'k = ' + repr(k)

        start=time.clock()


        for x in testSet:
            if x[-1]=='0':
                Test(trainingSet,x,k)
                if trainingSet[-1][-1]=='0':
                    FalseAndFalse += 1.
                if trainingSet[-1][-1]=='1':
                    TrueButActuallyFalse += 1.
            if x[-1]=='1':
                Test(trainingSet, x, k)
                if trainingSet[-1][-1]=='1':
                    TrueAndTrue += 1.
                if trainingSet[-1][-1]=='0':
                    FalseButActuallyTrue += 1.
        '''

        for x in testSet:
            prediction = GetPrediction(trainingSet,x,k)
            if prediction == '1':
                if x[-1] == '1':
                    TrueAndTrue += 1
                if x[-1] == '0':
                    TrueButActuallyFalse += 1
            if prediction == '0':
                if x[-1] == '1':
                    FalseButActuallyTrue += 1
                if x[-1] == '0':
                    FalseAndFalse += 1
        '''

        end=time.clock()
        endwall=time.time()

        # table=[["Result:     ","True","False"],["Predicted True",TrueAndTrue,TrueButActuallyFalse],["Predicted False",FalseButActuallyTrue,FalseAndFalse]]
        # table = [["Result:     ", "True", "False"], ["Predicted True", TrueAndTrue/(TrueAndTrue+FalseButActuallyTrue), TrueButActuallyFalse/(TrueButActuallyFalse+FalseAndFalse)],
        #          ["Predicted False", FalseButActuallyTrue/(TrueAndTrue+FalseButActuallyTrue), FalseAndFalse/(TrueButActuallyFalse+FalseAndFalse)]]
        # acc += (TrueAndTrue+FalseAndFalse) / (TrueAndTrue+FalseButActuallyTrue+TrueButActuallyFalse+FalseAndFalse)
        # truepositive += (TrueAndTrue) / (TrueAndTrue+FalseButActuallyTrue)
        # for row in table:
        #    for element in row:
        #        if element==row[-1]:
        #            print repr(element)
        #        else:
        #            print '\t'+repr(element)+'\t\t',

        print 'Runtime is: '+repr(end-start)+' seconds. '
        print 'Walltime is: '+repr(time.asctime(time.localtime(endwall)))

        # testarray=[[1,2,3,4,5],[5,4,3.2,2,1],[7,5,1,3,6]]
        # ScaleToUnit(testarray[1])
        # Generalize(testarray)
        # print repr([x[3] for x in testarray])
        # print repr(testarray)


    # print 'When k is '+ repr(k) +', The accuracy on average is: '+repr(acc/30)
    FalseButActuallyTrue = FalseButActuallyTrue
    TrueButActuallyFalse = TrueButActuallyFalse
    TrueAndTrue = TrueAndTrue
    FalseAndFalse = FalseAndFalse
    table = [["Result:     ", "True", "False"], ["Predicted True", TrueAndTrue / (TrueAndTrue + FalseButActuallyTrue),
                                                 TrueButActuallyFalse / (TrueButActuallyFalse + FalseAndFalse)],
             ["Predicted False", FalseButActuallyTrue / (TrueAndTrue + FalseButActuallyTrue),
              FalseAndFalse / (TrueButActuallyFalse + FalseAndFalse)]]
    table2 = [["Result:     ", "True", "False"], ["Predicted True", TrueAndTrue, TrueButActuallyFalse], ["Predicted False", FalseButActuallyTrue, FalseAndFalse]]
    print 'When k is ' + repr(k) + ', The accuracy matrix is: '
    for row in table:
        for element in row:
           if element==row[-1]:
               print repr(element)
           else:
               print '\t'+repr(element)+'\t\t',
    for row in table2:
        for element in row:
           if element==row[-1]:
               print repr(element)
           else:
               print '\t'+repr(element)+'\t\t',
    print 'The total accuracy is: ' + repr((TrueAndTrue + FalseAndFalse)/(TrueAndTrue + TrueButActuallyFalse + FalseAndFalse + FalseButActuallyTrue))
    k=k+2