#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

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

# Update anaconda to the latest version
conda update conda
conda update anaconda

# Install Python libraries
conda install pip  # Python package manager
# Computation deps
conda install numpy  # Python C vectors and computations
conda install scipy  # Scientific package
conda install scikit-learn  # Machine learning package
conda install pandas  # Data structure and statistics package
# Interaction and plotting deps
conda install matplotlib  # Plotting package
conda install ipython  # Interactive Python sessions
conda install ipython-notebook  # Python notebooks
# Theano 
conda install theano  # Theano CPU/GPU computations
