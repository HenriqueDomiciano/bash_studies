#! /bin/bash

log(){
    local data="${@}"
    if [[ $VERBOSE = 'true' ]]
    then
        echo "${data}" 
    fi
    logger -t luser-demo10.sh "${data}"
}

backup_file(){
    #This function creates a backup of a file 

    local FILE="${1}"
    if [[ -f "${FILE}" ]]
    then 
        local BACKUP_FILE="/var/tmp/$(basename $FILE).$(date +%F-%N)"
        log "BACKING UP ${FILE} to ${BACKUP_FILE}"
        cp -p "${FILE}" "${BACKUP_FILE}"
    else
        echo "FILE BACKUP FAILED" 
        return 1
    fi
}

readonly VERBOSE="true"
backup_file "${1}"


