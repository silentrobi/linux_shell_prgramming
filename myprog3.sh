#!/bin/sh

delete_zero_file () {
file_name="$1" # $1 is used to get 1st argument value
 

#check file exist/ not in the directory
if [ -e "$file_name" ]; then
   
    # check if file size is zero
    if [ ! -s "$file_name" ]; then
       
        rm "$file_name" # permanently delete empty file
        echo $file_name" File has size zero and deleted"
        
        return 1
    fi
    
fi
return 0
}

directory="$1"
# if argument is empty
if [ -z "$directory" ]; then
   directory="."
fi

#check directory exist / not
if [ -d "$directory" ]; then
     count=0	
     #iterate through file in the directory 
     for file in "$directory"/*
     do
     	delete_zero_file "$file"
     	if [ $? -eq 1 ]; then
     		count=$((count+1))
     	fi
     done
     echo "$count zero-length files are removed from the directory: \"$directory\""
     	
else
   echo "Directory does not exist."
fi
