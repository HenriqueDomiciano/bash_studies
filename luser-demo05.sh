#! /bin/bash
S="!@#$%&*()_-+"
# This scripts generate a list of random passwords

#Random number as password 
PASSWORD="${RANDOM}"

echo "${PASSWORD}"

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"

echo "${PASSWORD}"

# Use the current datetime 

PASSWORD=$(date +%s)
echo "${PASSWORD}"

# using nandseconds 

PASSWORD=$(date +%s%N)

echo "${PASSWORD}"



# using SHA256 AND DETERMINIG THE SIZE OF PASSWORD 

#SIZE="10"

read -p "DIGITE O TAMANHO DA SENHA" SIZE

if [[ "${SIZE}" -gt 256 ]]
then
    echo "Unreachable size number must be less than 256"
    exit 1 
fi

PASSWORD=$(date +%s%N | sha256sum | head -c${SIZE} )

PASS_WITH_SPEC=$(echo "${S}" | fold -w1 | shuf | head -c${SIZE_SPEC})


FULL_PASS=$(echo "${PASSWORD}${PASS_WITH_SPEC}" | shuf)

echo "${FULL_PASS}"