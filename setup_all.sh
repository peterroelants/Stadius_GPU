#!/bin/bash

# This script will install Anaconda python as well as the Python GPU packages.
source $HOME/.bashrc # Load the latest bash file
bash setup_python.sh # Install Anaconda python
source $HOME/.bashrc # Update bash file
bash setup_GPU.sh # config GPU
source $HOME/.bashrc # Update bash file
bash setup_theano.sh # Install Python GPU libs