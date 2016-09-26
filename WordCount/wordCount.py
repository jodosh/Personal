#!/usr/bin/python

#Released into the public domain 9/26/2016
#v0.0.1

import sys
import re
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
     

#Verify that 1st param is a path to a file, 
try:
    with open(str(sys.argv[1])) as f:
        fileContents= f.read()
except (IOError) as e:
    print(useageText)
    print e
    exit()


#regex to find one or more "word characters" (letters) surrounded by start and end of string
words = re.findall(r'\w+', fileContents)

lcWords = [word.lower() for word in words]

sortedWords = Counter(lcWords).most_common(numberOfWords)

for commonWord in sortedWords:
    print(commonWord)
