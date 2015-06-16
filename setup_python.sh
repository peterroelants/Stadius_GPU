#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

##########################
# Install Anaconda base  #
##########################
# Load the latest bash file
source $HOME/.bashrc

printf '\nStart installing Anaconda Python\n'
# Get the anaconda install script via 'wget' from the anaconda download page.
# To install the full anaconda distribution uncomment the next line:
# wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86_64.sh

# Only install Miniconda to avoid overhead of unused libraries
# Miniconda url: http://conda.pydata.org/miniconda
miniconda=Miniconda-latest-Linux-x86_64.sh  # Set variable to script name
wget --quiet https://repo.continuum.io/miniconda/$miniconda  # download script

# Install Miniconda via the downloaded script.
# Use -b to run install in batch mode.
bash $miniconda -b

# Add Anaconda to the PATH
if ! [[ :$PATH: == *"$HOME/miniconda/bin":* ]] ; then
	printf 'add Path to .bashrc\n'
    echo 'export PATH=$HOME/miniconda/bin:$PATH'  >> ~/.bashrc
    source ~/.bashrc # Load the update .bashrc file
fi

# Update anaconda to the latest version
# use linux 'yes' command to force yes
yes | conda update conda