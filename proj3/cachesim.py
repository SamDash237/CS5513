import math
import sys
import time

def main():
  cache = int(sys.argv[2]) #cache size in bytes
  line = int(sys.argv[3])  #block size of cache line
  ways = int(sys.argv[4])  #number of ways in the cache
  
  simulator = []                               #empty cache simulator
  linesInCache = round(cache/line)             #find all lines in a cache
  setsInCache = round(linesInCache/ways)       #find number of sets in a cache
  linesInSet = round(linesInCache/setsInCache) #find all lines in a set
  
  #initialize cache values to 0
  simulator = [[0,0,0,0,0,0] for i in range(linesInCache)]
  
  #initialize set values for internal cache calculations
  counter = 0
  curSet = 0
  curWay = 0
  
  for i in range(linesInCache):
    simulator[i][0] = curSet #current set value
    simulator[i][1] = curWay #current way value
    simulator[i][2] = "tag goes here"
    simulator[i][4] = "true LRU or write back"
    counter = counter + 1
    curWay = curWay + 1
    if (counter == linesInSet):
      counter = 0
      curSet = curSet + 1
      curWay = 0
  
  #initialize values for cache access and cache misses
  access = 0
  miss = 0
  
  f = open(sys.argv[1], "r") #open the file
  while True:
   inLine = f.readline()     #read line from file
   if inLine == "" or inLine == "#eof":
     break
   fields = inLine.split()   #split line into sections for calculation purposes
   if(len(fields) != 3):
     continue
   
   #caches in memory trace are accessed  
   access = access + 1
   
   #initialize values for cache hit and full set
   hit = 0
   full = 0
   
   lineAddress = int(fields[2], 16)                                            #convert hex string to int values
   offset = lineAddress & (line - 1)                                           #calculate offset using converted hex string and block size
   setIx = lineAddress >> int(math.log(line, 2)) & (setsInCache - 1)           #calculate set index using converted hex string, block size, and number of sets in cache
   tag = lineAddress >> (int(math.log(setsInCache,2)) + int(math.log(line,2))) #calculate tag using converted hex string, number of sets in cache, and block size
   
   #Check for write command in line      
   if(fields[1] == "W"):
     firstRow = linesInSet * int(setIx)
     for i in range(firstRow, firstRow + linesInSet):
       if(simulator[i][2] == tag): #check for hit, then write to simulator
         simulator[i][2] = tag
         simulator[i][3] = 1
         simulator[i][4] = "write back"
         simulator[i][5] = time.time()
         hit = 1
         break
         
     full = 1                      #set is full
     maxTimeConstant = sys.maxsize #constant to check access time against
     maxRow = -1                   #sets simulator index to last value
     
     #cache write miss in line
     if(hit == 0):
       miss = miss + 1
       for i in range(firstRow, firstRow + linesInSet):
         if(simulator[i][3] == 0):           #check for full set
           full = 0
           break
         if(simulator[i][5] < maxTimeConstant):
           maxTimeConstant = simulator[i][5] #add new access time
           maxRow = i
       if(full == 0):                        #set is to be filled
         simulator[i][2] = tag
         simulator[i][3] = 1
         simulator[i][4] = "true LRU"
         simulator[i][5] = time.time()
       else:                                 #set is full
         simulator[maxRow][2] = tag
         simulator[maxRow][3] = 1
         simulator[maxRow][4] = "true LRU"
         simulator[maxRow][5] = time.time()
   
   #Check for read command in line
   elif(fields[1] == "R"):
     firstRow = linesInSet * int(setIx)
     for i in range(firstRow, firstRow + linesInSet):
       if(simulator[i][2] == tag):     #check if way value matches tag
         hit = 1                       #if way = tag, it is a hit
         simulator[i][5] = time.time() #record access stamp
         break
     
     full = 1                      #set is full
     maxTimeConstant = sys.maxsize #constant to check access time against
     maxRow = -1                   #sets simulator index to last value
     
     #cache read miss in line
     if(hit == 0):
       miss = miss + 1
       for i in range(firstRow, firstRow + linesInSet):
         if(simulator[i][3] == 0):           #Check for full set
           full = 0
           break
         if(simulator[i][5] < maxTimeConstant):
           maxTimeConstant = simulator[i][5] #add new access time
           maxRow = i
       if(full == 0):                        #set is to be filled
         simulator[i][2] = tag
         simulator[i][3] = 1
         simulator[i][4] = "true LRU"
         simulator[i][5] = time.time()
       else:                                 #set is full
         simulator[maxRow][2] = tag
         simulator[maxRow][3] = 1
         simulator[maxRow][4] = "true LRU"
         simulator[maxRow][5] = time.time()
         
   
   #calculate the miss rate
   ratePercentage = miss/access
   rate = ratePercentage * 100
   
  #print out the miss rate
  print("Cache miss rate: {:0.2f}%".format(rate, 2))
  
if __name__ == '__main__':
  main()