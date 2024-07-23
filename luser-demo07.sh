# LEARNING WhILE LOOP 

echo "PARAM 0: ${1}"
echo "PARAM 1: ${2}"
echo "PARAM 2: ${3}"
echo


while [[ "${#}" -gt 0 ]]
do 
    echo "PARAM 0: ${1}"
    echo "PARAM 1: ${2}"
    echo "PARAM 2: ${3}"
    echo
    shift
done