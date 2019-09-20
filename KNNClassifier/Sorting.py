import random
import math
import time

def BinarySearch(array,key):
    length = len(array)
    if key > array[-1]:
        return length + 1
    if key < array[0]:
        return 0
    if length == 2:
        if array[0] < key < array[1]:
            return 1
        else:
            return 2
    if key < array[length/2]:
        return BinarySearch(array[0:length/2],key)
    else: 
        return BinarySearch(array[length/2:length],key) + length/2

    
'''    
def UpdateSmall(array,element,k):
    length = len(array)
    if length < k:
        newarray = array
        newarray.append(element)
        newarray = sorted(newarray)
        return newarray
    if length >= k:
        location = BinarySearch(array,element)
        # print repr(array[0:location])
        newarray = array[0:location-1]
        newarray.append(element)
        # print repr(newarray)
        for i in range(k - location):
            newarray.append(array[location - 1 + i])
        return newarray
'''
    
def UpdateSmall(array, element, k):
    length = len(array)
    if array[0] == [0,0]:
        newarray = []
        newarray.append(element)
        # print 'array' + repr(array)
        return newarray
    if array[0] != [0,0] and length < k:
        newarray = array
        newarray.append(element)
        newarray = sorted(newarray)
        # if length == 20:
            # print repr(newarray)
        return newarray
    if length == k:
        location = BinarySearch(array, element)
        # print 'location: ' + repr(location)
        # print repr(array[0:location])
        if location == 0:
            newarray = [element]
            for i in range(k-1):
                newarray.append(array[i])
            return newarray
        if location == 1:
            newarray = [array[0]]
            newarray.append(element)
            for i in range(k-2):
                newarray.append(array[i+1])
            return newarray
        if 1 < location < k - 1:
            # print repr(array)
            newerarray = array[0:location]
            newerarray.append(element)
            for i in range(k - 1 - location):
                newerarray.append(array[location + i])
            # print repr(newerarray)
            return newerarray
        if location == k - 1:
            newarray = array[0:k-1]
            newarray.append(element)
            return newarray
        if location > k - 1:
            return array
#             newarray = array
#             return newarray

'''    
print 'Test!'
testarray = [[5,2],[4,3],[2,1],[9,8],[7,6],[0,6],[4,4],[1,3],[3,2]]
testarray = sorted(testarray)
k = 10
print repr(testarray)
testarray = UpdateSmall(testarray,[3.5,3],k)
print repr(testarray)
testarray = UpdateSmall(testarray,[3.8,9],k)
print repr(testarray)
testarray = UpdateSmall(testarray,[3.5,3],k)
print repr(testarray)
'''
array1 = []
array2 = []
for i in range(750):
    array1.append(random.random())
    array2.append(random.random())
sum = 0
start = time.clock()
for j in range(30000):
    for i in range(750):
        sum = sum + pow(array1[i] - array2[i],2)
end = time.clock()
print repr(len(array1))
print repr(sum)
print 'Calculate 30000 times 750*750 takes' + repr(end - start) + 'seconds. '
