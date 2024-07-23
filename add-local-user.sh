#! /bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then 
    echo "YOU MUST BE SUPERUSER TO RUN THIS COMMAND" 
    exit 1
fi 

#Get the host name
HOSTNAME=$(hostname)


# Get the username (login).

read -p "TYPE THE USERNAME" USERNAME

# Get the real name (contents for the description field).

read -p "TYPE YOUR REAL NAME" NAME

# Get the password.

read -p "TYPE YOUR PASSWORD" PWD

# Create the user with the password.

useradd -c "${NAME}" -m "${USERNAME}"

# Check to see if the useradd command succeeded.

if [[ "${?}" -ne 0 ]]
then 
    echo "Something went wrong creating the user"
    exit 1
fi
# Set the password.

echo "${PWD}" | passwd --stdin "${USERNAME}" 

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then 
    echo "Something went wrong creating the password" 
    exit 1
fi
# Force password change on first login.

passwd -e "${USERNAME}"

# Display the username, password, and the host where the user was created. 

echo "USERNAME : ${USERNAME} "
echo "PASSWORD : ${PWD}"
echo "HOST MACHINE : ${HOSTNAME}"
echo "created with sucess"

exit 0 