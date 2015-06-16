#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

########################
# Config and check GPU #
########################

printf 'Check 3D controller:\n'
lspci | grep -i NVIDIA

printf '\nRun nvidia-smi:\n'
nvidia-smi

# Add CUDA to the LD_LIBRARY_PATH
if ! [[ :$LD_LIBRARY_PATH: == *:"/usr/local/cuda/lib64":* ]] ; then
	printf 'Add cuda LD_LIBRARY_PATH to .bashrc\n'
    echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH'  >> $HOME/.bashrc
    source $HOME/.bashrc # Load the update .bashrc file
fi

# Add CUDA to the PATH
if ! [[ :$PATH: == *:"/usr/local/cuda/bin":* ]] ; then
	printf 'Add cuda PATH to .bashrc\n'
    echo 'export PATH=$PATH:/usr/local/cuda/bin'  >> $HOME/.bashrc
    source $HOME/.bashrc # Load the update .bashrc file
fi


#########################
# Install Anaconda base #
#########################
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