#!/bin/bash

# This script will set up the Python Theano library
# Make sure that you have Anaconda python installed and added to the
#  path before you run this script.
# Make sure that you have the GPU activated

# Load the latest bash file
source $HOME/.bashrc

########################################
# Install Anaconda packages and Theano #
########################################
printf '\nStart installing Theano and other packages\n'
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
printf '\nConfigure and check Theano\n'
source ~/.bashrc # Load the lastest .bashrc file
# Copy theanorc to home folder
yes | cp -f theanorc $HOME/.theanorc
# Run theano test
bash test_theano.sh