#! /bin/bash 

if [[ "${UID}" -ne 0 ]]
then 
    echo "You must be root user"
    exit 1 
fi 

if [[ "${#}" -lt 2 ]]
then 
    echo "Usage : [USERNAME] [USER COMMENT] Note that command is mandatory if you do not want to put comment just pass '' "
    exit 1 
fi 

while [[ "${#}" -gt 0 ]] 
do 

    useradd -c "${2}" -m "${1}"

    if [[ "${?}" -ne 0 ]]
    then 
        echo "Something went wrong creating the user"
        exit 1
    fi

    PWD=$(date +%s%N | sha256sum | head -c48)

    # Pass Passwd, to stdin

    echo "${PWD}" | passwd --stdin "${1}" 

    if [[ "${?}" -ne 0 ]]
    then 
        echo "Something went wrong creating the password" 
        exit 1
    fi

    # Display the pwd,user etc
    echo "USERNAME : ${1} "
    echo "PASSWORD : ${PWD}"
    echo "HOST MACHINE : ${HOSTNAME}"
    echo "created with sucess"
    echo
    shift 
    shift

done
exit 0 
