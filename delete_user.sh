#! /bin/bash

#This script delets an user

if [[ "${UID}" -ne 0 ]]
then 
    echo "You must be root to run this script"
    exit 1
fi 

USER="${1}"

userdel ${USER}

if [[ "${?}" -ne 0 ]]
then 
    echo "The user ${USER} was NOT deleted" >&2
    exit 1
fi

echo "The user ${USER} was deleted"

exit 0 