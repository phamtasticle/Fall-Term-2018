#!/bin/bash
#Kevin Pham
#This script is to test case the inputs
#of a program and check to see if the output
#is correct with the gold file.

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
echo "Test Run Undergrade $i Credits"
~cgi_web/Tuition/cost <inputUG$i >temp #Get the input from a file, and store the outputin a temporary file

cmp -s temp goldUG$i #compare the file to the correct output file to make sure they have the same bytes
if [ $? -eq 0 ];

then 
	echo "Test Pass"	
else
	echo "Test Failed"
	cat temp goldUG$i  >>error.txt #store the error output and the correct output into a file
	
fi
done

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 
do
echo "Test Run Graduate $i Credits"
~cgi_web/Tuition/cost <inputGR$i > temp

cmp -s temp goldGR$i
if [ $? -eq 0 ];

then 
	echo "Test Pass"	
else
	echo "Test Failed"
	cat temp goldGR$i  >>error.txt
	
fi
done
