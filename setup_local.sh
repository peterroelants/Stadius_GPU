#!/bin/bash

# Script to setup Anaconda python from the local host

# Check if the file is passed as argument
if [ "$1" == "" ]; then
    echo "Stadius user name expected as input"
    exit 2
fi

# User name is stored in variable $1
ssh -A -t proelant@ssh.esat.kuleuven.be ssh -A -t sista-nc-3 "ls 
exit"