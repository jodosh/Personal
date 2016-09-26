#!/usr/bin/python

#Released into the public domain 9/26/2016
#v0.0.1

import sys
from collections import Counter

useageText="""\n\nThis program reads a text file and prints the most common words in it\n
Useage:
####################
$wordCount.py $FILENAME $NUMWORDS
####################\n\n
$FILENAME is the path to the text file to search for most common words\n
$NUMWORDS is the number of of words to display (sorted by most common)"""


#Verify that correct number of arguments are passed
if (len(sys.argv) != 3):
    print(useageText)
    exit()

#Verify that the 2nd param is an int    
try:
    numberOfWords = int(sys.argv[2])
except:
    print(useageText)
    exit()
    
words = []    

#Verify that 1st param is a path to a file, 
#if so create array of all lines in the file
try:
    with open(str(sys.argv[1])) as f:
        lines= f.readlines()
except (IOError) as e:
    print(useageText)
    print e
    exit()

#for each line split into words based on white space
#then slice off trailing punctuation
#finally convert to lowercase and save in an array of words
for line in lines:
    lineArray = line.split()
    for word in lineArray:
        while word and not word[-1].isalpha():
            word = word[:-1]
        if word != '':
            words.append(word.lower())
        
#save array of most common words and their count
sortedWords = Counter(words).most_common(numberOfWords)

for commonWord in sortedWords:
    print(commonWord)
