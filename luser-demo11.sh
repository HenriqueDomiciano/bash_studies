#! /bin/bash

#Use this scirpt just to test getopts

usage(){
    echo "Usage ${0} [-vs] [-l LENGHT]"
    echo "Generate an random password"
    echo "-l [LENGHT] determine the password LENGHT"
    echo "-s Use special character or not"
    echo "-v Use verbose mode"
    exit 1
}

verbose(){
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]]
    then 
        echo "${MESSAGE}"
    fi
}

LENGTH=48; 
MAX=128;

while getopts vl:s OPTION
do 
    case ${OPTION} in
        v)
            VERBOSE='true';
            verbose "verbose mode ON"
            ;;
        l) 
            LENGTH="${OPTARG}"
            verbose "size ${LENGTH}"
            ;;
        s)
            USEESPECIAL="true"
            ;;
        ?)
            usage >&2  
            exit 1
            ;; 
    esac
done

echo "OPTIND : ${OPTIND}"

if [[ "${#}" -gt 0 ]]
then 
    usage
fi 

verbose "Generating password"

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha512sum | head -c${LENGTH})

verbose "PASSWORD GENERATED"

#APPEND SPECIAL CARACHTER

if [[ "${USEESPECIAL}" = "true" ]]
then 
    ESPECIALCHAR=$(echo "!@#$%%&*|[]/?" | fold -w1 | shuf | head -c1)
    verbose "GENERATED SPECIAL CHAR"
    PASSWORD="${PASSWORD}${ESPECIALCHAR}"
    verbose "APPENDED SPECIAL CHAR" 
fi 

echo "${PASSWORD}"


