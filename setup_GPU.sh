#!/bin/bash

# Script to check and activate the GPU

# Load the latest bash file
source $HOME/.bashrc

########################
# Config and check GPU #
########################
# Check if GPU is present
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
