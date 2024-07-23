#! /bin/bash

#display the UID
#only display the UID if is different then 1000 
#display if thhe user is vagrant or not 

#Display the UID 

USERID="${UID}"

USER_ID_TO_TEST='1000'

if [[ "${USERID}" -ne "${USER_ID_TO_TEST}" ]]
then 
    echo "USER ID ${UID} DOES NOT MATCH ${USER_ID_TO_TEST}"
    exit 1 
else
    echo "USER ID IS EQUAL TO ${USER_ID_TO_TEST}"
fi 

USER_NAME_TO_TEST="vagrant"

USER_NAME=$(id -un)
if [[ "${?}" -ne 0 ]]
then 
    echo "COMAND NOT WORKED EXITING"
    exit 1
else
    if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
    then 
        echo "You are a ${USER_NAME_TO_TEST} user"
    else
        echo "You are not a ${USER_NAME_TO_TEST} user"
        exit 1
    fi
fi

exit 0 