#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

# Get the anaconda install script via 'wget' from the anaconda download page.
# Note: To install a newer version of Anaconda Python, find the new download 
#  link at http://continuum.io/downloads . If you update this link, you should
#  also update the reference to the file below.
# To install the full anaconda distribution uncomment the next line
# wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86_64.sh

# Only install Miniconda to avoid overhead of unused libraries
# Miniconda url: http://conda.pydata.org/miniconda
miniconda=Miniconda-2.2.2-Linux-x86_64.sh
wget --quiet https://repo.continuum.io/miniconda/$miniconda

# Install Miniconda via the downloaded script
# Note that if you update the link above to a newer Anaconda version, you 
#  should also update this file.
# Use -b to run install in batch mode
./$miniconda -b