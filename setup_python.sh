#!/bin/bash

# This script will set up Python via Anaconda Python
# Anaconda Python is a python distribution targeted to scientific programming
#  and has most of the libraries you need.
# More info: https://store.continuum.io/cshop/anaconda/

# Get the anaconda install script via 'wget' from the anaconda download page.
# Note: To install a newer version of Anaconda Python, find the new download 
#  link at http://continuum.io/downloads . If you update this link, you should
#  also update the reference to the file below.
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.2.0-Linux-x86.sh

# Install Anaconda via the downloaded script
# Note that if you update the link above to a newer Anaconda version, you 
#  should also update this file
bash Anaconda-2.2.0-Linux-x86.sh