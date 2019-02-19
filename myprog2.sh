#!/bin/bash


find_max () { # to find max integer number from array of integer.
numbers=("$@") #get array of numbers
max=${numbers[0]} 
for number in ${numbers[@]}; do
    if (( $number > $max )); then max=$number 
    fi; 
done
echo "Maximum: $max"
}


numbers=() # array of integer numbers
index=0
re='^[0-9]+$' # integer regular expression
echo 'Enter a sequence of numbers followed by "end"'
read input
filtered_input="$(echo -e "${input}" | tr -d '[:space:]')" # filtered input removes white all spaces from the input
while [[ $filtered_input != "end" ]]
do
	#if input is integer
	if [[ $filtered_input =~ $re ]]; then
	
		 numbers[$index]=$filtered_input
		 index=$((index+1))

	fi
	read input
	# filtered input removes all white spaces from the input
	filtered_input="$(echo -e "${input}" | tr -d '[:space:]')" 
done

find_max "${numbers[@]}" #calling find_max function



