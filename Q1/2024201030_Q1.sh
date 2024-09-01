#!/bin/bash

# a - Remove empty lines and generate a quotes_empty.txt file.
outputA="empty_lines.txt"

grep -n '^.' quotes.txt | awk -F'[0-9]:' '{print $2}' > $outputA

# b - Remove duplicates and generate a quotes_rdup.txt file
outputB="quotes_rdup.txt"

sort $outputA | uniq > $outputB

# c - Count number of quotes by personality and print them in quotes_byperson.txt file
outputC="quotes_byperson.txt"

awk -F'~' '{print $NF}' $outputB > persons.txt

# To remove the spaces at the start of a line in a file
sed 's/^ *//' persons.txt > persons2.txt
rm persons.txt

declare -A peopleMap
while read line;
do
    peopleMap["$line"]=$((peopleMap["$line"]+1))
done < persons2.txt

# ! - retreives keys of the map
for person in "${!peopleMap[@]}"; 
do
    echo "$person: ${peopleMap[$person]}"
done > $outputC

rm persons2.txt

# d - List all the words in the file that starts with ‘s’ and doesn’t follow by ‘a’
grep -o -i "\bs[^aA ]\w*" quotes.txt > words.txt