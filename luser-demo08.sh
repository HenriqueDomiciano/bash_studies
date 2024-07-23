#! /bin/bash 
# THIS SCRIPT WILL SHOW ADVANCED IO 

# REDIRECT STDOUT TO A FILE 
FILENAME="/tmp/data.log"
head -n1 /etc/passwd > ${FILENAME}

# Redirect FROM FILE TO STDIN 
read LINE < ${FILENAME}

# OVERWRITE DATA 
head -n3 /etc/passwd > "${FILENAME}"

echo "contents on ${FILENAME}"

# appending data 
echo "DATA" > "password.txt"

echo "pass" >> "password.txt"

date +%s%N | sha256sum | head -c8 >> "password.txt"

#USING FILES DISCRITORS 

#USING FILE DESCRIPTOR 0 
echo
read LINE 0<${FILENAME}
echo
echo "LINE CONTAINS ${LINE}"
echo

# REDIRECT STDOUT TO A FILE USING FD1, OVERWRITING THE FILE

head -n3 /etc/passwd 1> ${FILENAME}
echo 
echo "Contents of ${FILENAME} : "
cat "${FILENAME}"
echo

#REDIRECT STANDART ERROR OR STANDARD OUTPUT TO FILE 
head -n3 /etc/passwd /fakefile &> "${FILENAME}"
echo "Contents of ${FILENAME} : "
cat "${FILENAME}" 
echo

# Pipping and recording 
head -n3 /etc/passwd /fakefile |& cat -n &> "${FILENAME}"
echo "Contents of ${FILENAME} : "
cat "${FILENAME}" 
echo

#SENDING ERRORS AS STANDARD ERRORS 
echo "THIS IS AN ERROR" >&2
echo