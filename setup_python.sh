#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

########################
# Config and check GPU #
########################

echo 'Check 3D controller:'
lspci | grep -i NVIDIA

echo '\nRun nvidia-smi:'
nvidia-smi



#########################
# Install Anaconda base #
#########################
echo '\nStart installing Anaconda Python'
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

# Add Anaconda to the .bashrc path
echo 'export PATH=$HOME/miniconda//bin:$PATH'  >> ~/.bashrc
# Load the update .bashrc file
source ~/.bashrc

########################################
# Install Anaconda packages and Theano #
########################################
echo '\nStart installing Theano and other packages'
# use linux 'yes' command to force yes
# Update anaconda to the latest version
yes | conda update conda

# Install Python libraries
yes | conda install pip  # Python package manager
# Computation deps
yes | conda install numpy  # Python C vectors and computations
yes | conda install scipy  # Scientific package
yes | conda install scikit-learn  # Machine learning package
yes | conda install pandas  # Data structure and statistics package
# Interaction and plotting deps
yes | conda install matplotlib  # Plotting package
yes | conda install ipython  # Interactive Python sessions
yes | conda install ipython-notebook  # Python notebooks
# Theano 
yes | conda install theano  # Theano CPU/GPU computations

###########################
# Config and check Theano #
###########################
echo '\nConfigure and check Theano'
# Copy theanorc to home folder
cp -f theanorc $HOME/.theanorc
# Run theano test
bash test_theano.sh