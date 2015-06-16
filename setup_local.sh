#!/bin/bash

# Script to setup Anaconda python from the local host

# Check if the port number is passed as argument
if [ "$1" == "" ]; then
    echo "Port number expected as input"
    exit 2
fi

# Check if a title for the front matter is passed as an argument
if [ "$2" == "" ]; then
    echo "You should provide a title as second argument"
    exit 2
fi

# User name is stored in variable $1
ssh -A -t proelant@ssh.esat.kuleuven.be ssh -A -t sista-nc-3 "ls 
exit"