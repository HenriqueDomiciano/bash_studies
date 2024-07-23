#! /bin/bash

#This scripts demonstrates case statements 

#if [[ "${1}" = "start" ]] 
#then 
#    echo "Starting"
#elif [[ "${1}" = 'stop' ]]
#then 
#    echo "Stoping."
#elif [[ "${1}" = 'status' ]]
#then
#    echo "Status:"
#else
#    echo "Supply a valid option" >&2
#    exit 1 
#fi 

#Example using case
case "${1}" in 
start)
    echo "starting"
    ;;
stop)
    echo "stoping"
    ;;
status|state|--status|--state)
    echo "Status"
    ;;
*)
    echo "Supply a valid value" >&2
    exit 1 
    ;;
esac
