#! /bin/bash


usage(){
    echo "Usage ${0} USERS [advr]"
    echo "Disable, archive or delete user"
    echo "-a [LENGHT] creates an archive on home directory with an gzip tar file"
    echo "-d Deletes the account and its contents"
    echo "-r removes the home directory"
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


check_fail(){
    local MESSAGE="${@}"
    if [[ "${?}" -ne 0 ]]
        then 
            echo "${MESSAGE}" >&2
            exit 1
    fi
}


#see if its root 
if [[ "${UID}" -ne 0 ]]
then 
    echo "You must be root to run this program"
    exit 1
fi 

VERBOSE="false"
BUILD="false"
DELETE="false"
REMOVE="false"

while getopts advr OPTION
do 
    case ${OPTION} in
    a)
        BUILD="true"
        ;;
    d)
        DELETE="true"
        ;;
    v)
        VERBOSE="true"
        ;;
    r)
        REMOVE="true"
        ;;
    ?)
        usage >&2
        exit 1
done 

verbose "Already processed parameters shifting to accounts"

shift $(( OPTIND -1 ))

verbose "PROCESSING ACCOUNTS"

for user in "${@}"
do 
    #CHECK IF USER HAS UID BIGGER THAN 1000

    if [[ $(uid "${user}") -lt 1000 ]] 
    then 
        echo "CANNOT DISABLE OR DELETE ACCOUNT ${user} because its an sistem account"
        continue

    if [[ '${BUILD}' = 'true' ]]
    then
        verbose "BUILDING THE FILE OF USER ${user} on archive/${user}.tar.gz AND ADDING AN BACKUP TO IT"
        mkdir -p "/archive/${user}" &> /dev/null
        tar -cfzv "/archive/${user}.tar.gz" "/home/${user}"
        check_fail "FAILED TO MAKE BACKUP FOR USER ${user}"
        echo "DISABLED ${user} AND BUILDED BACKUP"
    fi 

    if [[ '${DELETE}' = 'true' ]]
    then 
        if [[ $"{REMOVE}" = 'true' ]]
        then 
            verbose "DELETING ${user} AND ITS MESSAGES"
            userdel -r "${user}" 
            check_fail "FAILED TO DELETE MESSAGES AND USER"
            echo "DELETED ${user}"
        else
            verbose "DELETING ${user} ONLY NOT DELETING ALL FILES"
            userdel "${user}"
            check_fail "FAILED TO DELETE ${user}"
        fi
    else
        usermod usermod -L -e 1 "${user}"
        check_fail "FAILED TO DISABLE ${user}"
    fi 

done



