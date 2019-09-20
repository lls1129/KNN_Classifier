# KNN implement by Linsheng Liu
# Read the kaggle data
# To run this, python2.7 is required!!!!!
# Again!!! 2.7!!!!!!!!
import csv
import random
import math
import time


# Deleting empty pixel which is always 0 for all images.
def AddColumn(dataset, column):
    for i in range(len(dataset)):
        dataset[i].append(column[i])
    return dataset
def ReduceDim(dataset):
    ReducedDataset = [[]*1 for i in range(len(dataset))]
    column = len(dataset[0])
    for i in range(column):
        ThisColumn = [x[i] for x in dataset]
        if sum(ThisColumn) != 0:
            AddColumn(ReducedDataset, ThisColumn)
    return ReducedDataset


# load the mnist data.
def loadDataset(filename, split, trainingSet=[], testSet=[]):
    with open(filename, 'rb') as csvfile:
        lines = csv.reader(csvfile)
        dataset = list(lines)
        dataset = dataset[1:len(dataset)]
        # for convenience, move the label to last column
        labelcolumn = [x[0] for x in dataset]
        dataset = [x[1:len(dataset[1])+1] for x in dataset]
        for i in range(len(dataset)):
            dataset[i].append(labelcolumn[i])

        # Pre-process data
        for x in range(len(dataset)):
            for y in range(len(dataset[x])):
                dataset[x][y] = int(dataset[x][y])
        # dataset = ReduceDim(dataset)
        # For mnist data, generalized is not necessary.
        # Generalize(dataset)

        for x in range(len(dataset)):
            # for y in range(len(dataset[x])-1):
                # dataset[x][y] = float(dataset[x][y])
            if random.random() < split:
                trainingSet.append(dataset[x])
            else:
                testSet.append(dataset[x])
    print 'Data loading finished! '
    print repr(testSet[-1])
    print repr(testSet[-2])



'''
# Generalizing the data by normalizing and rescalling the data:
def Normalize(array):
    if len(array)==0:
        return 0
    mean=sum(array)/len(array)*1.0
    var=0
    for x in array:
        var+=(x-mean)*(x-mean)
    sd=math.sqrt(var/len(array))
    if sd==0:
        return array
    # print repr(sd)
    for i in range(len(array)):
        array[i]=(array[i]-mean)/sd
    return array

def ScaleToUnit(array):
    zero=[0.]*len(array)
    # change to any distances needed.
    norm=EuclideanDistance(zero,array,len(array))
    if norm==0:
        return array
    for i in range(len(array)):
        array[i]=array[i]/norm
    return array

def Rescalling(array):
    Min=min(array)*1.0
    Max=max(array)*1.0
    if Max-Min==0:
        return array
    for i in range(len(array)):
        array[i]=(array[i]-Min)/(Max-Min)
    return array

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
        # distances.append([EuclideanDistance(x,instance,len(instance)-1),x[-1]])
    return MergeSortFirstKSmall(distances,k)

def GetLabel(trainingSet,instance,k):
    neighbors = GetNeighbor(trainingSet,instance,k)
    count = [0]*10
    for x in neighbors:
        count[int(x[-1])]+=1
    return -max((x, -i) for i, x in enumerate(count))[1]

def UpdateLabel(instance,score):
    instance[-1]=score

def Test(trainingSet,instance,k):
    UpdateLabel(instance, GetLabel(trainingSet, instance, k))
    trainingSet.append(instance)

def UpdateConfusionMatrix(matrix, predict, label):
    matrix[predict][label] += 1
    return matrix


# acc = 0
power = 2
ConfusionMatrix=[[[0. for j in range(10)] for i in range(10)] for k in range(11)]

# load the data. Pre-process is with loading.
trainingSet=[]
testSet=[]
loadDataset('train_short.csv',0.8,trainingSet,testSet)
indicator = 0
start=time.clock()
for x in testSet:

    if indicator%500 == 0:
        print 'This the ' + repr(indicator) + 'th test. Now it is ' + repr(time.asctime(time.localtime(time.time())))
    indicator += 1
    Neighbors = GetNeighbor(trainingSet, x, 21)
    KLabel = [0.] * 11
    for t in range(11):
        k = 2 * t + 1
        KNeighbor = Neighbors[0:k]
        count = [0.] * 10
        for xx in KNeighbor:
            count[int(xx[-1])] += 1.
        KLabel[t] = -max((x, -i) for i, x in enumerate(count))[1]
        UpdateConfusionMatrix(ConfusionMatrix[t],KLabel[t],x[-1])

end=time.clock()
endwall=time.time()
print 'Runtime is: '+repr(end-start)+' seconds. '
print 'Walltime is: '+repr(time.asctime(time.localtime(endwall)))


for t in range(11):
    print 'When k = ' + repr(2 * t + 1) + ', the Confusion matrix is: '
    for i in range(10):
        print(repr(ConfusionMatrix[t][i]))







    # for i in range(10):
        # print 'Test[' + repr(i) + '] is: ' + repr(testSet[i])

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
    # FalseButActuallyTrue=0.
    # TrueButActuallyFalse=0.
    # TrueAndTrue=0.
    # FalseAndFalse=0.
    # k=2*t+1
    # k=21
    # k=13


    '''
    # indicator = 0
    for x in testSet:
        # indicator+=1
        # if indicator%50==0:
            # print 'I am still alive!!! This is the ' + repr(indicator) + 'th test. '
        if x[-1]!=4:
            Test(trainingSet,x,k)
            if trainingSet[-1][-1]!=4:
                FalseAndFalse+=1
            if trainingSet[-1][-1]==4:
                TrueButActuallyFalse+=1
        if x[-1]==4:
            Test(trainingSet, x, k)
            if trainingSet[-1][-1]==4:
                TrueAndTrue+=1
            if trainingSet[-1][-1]!=4:
                FalseButActuallyTrue+=1
    



    KAccuracy = [0.] * 11
    KCorrect = [0.]*11
    TP4 = [0.]*11
    TPN4 = [0.] * 11
    P4 = [0.] * 11
    PN4 = [0.] * 11
    for x in testSet:
        Neighbors = GetNeighbor(trainingSet,x,21)
        KLabel = [0.]*11
        for t in range(11):
            kk = 2 * t - 1
            KNeighbor = Neighbors[0:kk]
            count = [0.] * 10
            for xx in KNeighbor:
                count[int(xx[-1])] += 1.
            KLabel[t] = -max((xx, -i) for i, x in enumerate(count))[1]
            if KLabel[t] == x[-1]:
                KCorrect[t] += 1.
            if KLabel[t] == 4:
                P4[t] += 1.
                if x[-1] == 4:
                    TP4[t] += 1.
            if KLabel[t] != 4:
                PN4[t] += 1.
                if x[-1] != 4:
                    TPN4[t] += 1.
        # trainingSet.append(x)
    # KAccuracy = Kcorrect/len(testSet)




    
    table=[["Result:     ","True","False"],["Predicted True",TrueAndTrue,TrueButActuallyFalse],["Predicted False",FalseButActuallyTrue,FalseAndFalse]]
    # table = [["Result:     ", "Actual 4", "Actual Not 4"], ["Predicted 4", TrueAndTrue/(TrueAndTrue+FalseButActuallyTrue), TrueButActuallyFalse/(TrueButActuallyFalse+FalseAndFalse)],
    #          ["Predicted Not 4", FalseButActuallyTrue/(TrueAndTrue+FalseButActuallyTrue), FalseAndFalse/(TrueButActuallyFalse+FalseAndFalse)]]
    # acc+=TrueAndTrue/(TrueAndTrue+FalseButActuallyTrue)
    for row in table:
        for element in row:
            if element==row[-1]:
                print repr(element)
            else:
                print '\t'+repr(element)+'\t\t',
    '''


    # testarray=[[1,2,3,4,5],[5,4,3.2,2,1],[7,5,1,3,6]]
    # print 'Max: '+ repr(-max((x, -i) for i, x in enumerate(testarray))[1])
    # ScaleToUnit(testarray[1])
    # Generalize(testarray)
    # print repr([x[3] for x in testarray])
    # print repr(testarray)


# print 'Accuracy on average is: '+repr(acc/3)


