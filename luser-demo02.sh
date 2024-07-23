#!/bin/bash

# DISPLAY THE UID AND USERNAME OF THE USER
# DISPLAY IF THE USER IS ROOT OR NOT

# Display the UID 

echo "Your UID is ${UID}"


USER_NAME=$(id -un)

# Display the username 
echo "YOUR USERNAME is ${USER_NAME}"


# Display if the user is root or not
if [[ "${UID}" -eq 0 ]]
then 
    echo "YOU ARE ROOT"
else
    echo "YOU ARE NOT ROOT"
fi
