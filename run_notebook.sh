#!/bin/bash

# Script to start a SSH tunnel to sista-nc-3 through ssh.esat.kuleuven.be and 
#  start an IPython notebook on this remote server.
# Run by:
#  bash run_notebook.sh <user_name> <port_number> 
# script takes 2 arguments: 
#  <user_name>: Stadius username of the user that wants to log in
#  <port_number>: The port number used for the tunnels and IPython notebook
#                 on the local, gateway and remote machines.
#                 Should be between 1024 and 65535.
#                 If not provided default port becomes 7878


# Check if the name  is passed as argument
if [ "$1" == "" ]; then
    echo "Stadius username expected."
    exit 2
fi

PORTNB=$2
# Check if the name number is passed as argument
if [ "$PORTNB" == "" ]; then
    PORTNB=7878
fi

# Create a tunnel and start the IPython notebook
# The IPython notebook is started by:
#  ipython notebook --no-browser --port=7777
# The SSH -A option enables forwarding of the authentication agent connection
# The SSH -t option forces terminal allocation
# The SSH -L option is used for port fowarding (port:host:hostport)
ssh -A -t -L $PORTNB:localhost:$PORTNB $1@ssh.esat.kuleuven.be ssh -A -t -L $PORTNB:localhost:$PORTNB sista-nc-3 "ipython notebook --no-browser --port=$PORTNB"


# Info on remote hosting of IPython notebooks:
#   http://www.hydro.washington.edu/~jhamman/hydro-logic/blog/2013/10/04/pybook-remote/
# Info on SSH tunneling
#  http://superuser.com/questions/96489/ssh-tunnel-via-multiple-hops
#  http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html