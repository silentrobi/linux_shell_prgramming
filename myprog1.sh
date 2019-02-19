#!/bin/sh

generate_star () { # print start function
    count=0
    limit=$1	# passing argument
    while [ $count -lt $limit ]
    do
    	echo -n "*"
    	count=$((count+1))
    done
    echo -n "\n"		
}

fileName="$1" # $1 get the first argument
#check if file exist/not
if [ -f "$fileName" ]; then
	echo "file exists, now processing file"
else
	echo "file does not exist"
	exit 1
fi
# read file line by line
while read data
do
	
	generate_star $data # calling the fuction with argument "data" which is read from file
done < "$fileName"



