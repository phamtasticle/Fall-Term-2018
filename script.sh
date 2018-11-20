#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
echo "Test Run Undergrade $i Credits"
~cgi_web/Tuition/cost <inputUG$i >temp

cmp -s temp goldUG$i
if [ $? -eq 0 ];

then 
	echo "Test Pass"	
else
	echo "Test Failed"
	cat temp goldUG$i  >>error.txt
	
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
