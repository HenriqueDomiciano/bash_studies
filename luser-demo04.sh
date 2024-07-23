#! /bin/bash

# this script creates an account on the local system 
# you will be prompted for the account and username 


#Ask for username
read -p "Type your user name: " USERNAME

#Ask the real name
read -p "TYPE TOUR REAL NAME: " NAME

#Ask the pwd
read -p "TYPE YOUR PASSWORD: " PASSWORD

#create the user 

useradd -c "${NAME}" -m "${USERNAME}" 

#create pwd to user 
echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

#force the user to change the pwd on firt login  

passwd -e "${USERNAME}"