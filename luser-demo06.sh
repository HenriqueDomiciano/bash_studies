#! /bin/bash 

# This script generates a pwd for eaxh user on the command line 


# Dispay the last command 
echo "You executed this command: ${0}"
echo "The first parameter is: ${1} "

# display the path and filename of the script 
echo "The path to the file in the script is $(dirname ${0})"
echo "The name of the script is $(basename ${0})"


#Tell the user how many argumets they have passed 
NUMBER_OF_PARAMS="${#}"

echo "The number of params passed was: ${NUMBER_OF_PARAMS}" 

if [[ "${NUMBER_OF_PARAMS}" -lt 1 ]]
then 
    echo "The number of params is 0 you must pass at least one user"
    echo "Usage : ${0} USER_NAME [USER_NAME]..."
    exit 1
fi

for USER_NAME in "${@}" 
do 
    PWD=$(date +%s%N | sha256sum | head -c48)
    echo "${USER_NAME}: ${PWD}"
done