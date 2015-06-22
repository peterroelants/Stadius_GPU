# Setup and use Python with the GPU on the server


## Setup Anaconda Python and Theano

To set up the [Anaconda Python](https://store.continuum.io/cshop/anaconda/) distribution in your home directory and install the [Theano](http://deeplearning.net/software/theano/) library you can follow the following steps (please read through this full section before executing the steps.)

Login to the sista-nc-3 server and copy this repository to your home folder as was illustrated in the [readme](https://github.com/peterroelants/Stadius_GPU/blob/master/Readme.md).

Go to the `~/Stadius_GPU/Python/` directory on your home folder by:

    cd ~/Stadius_GPU/Python/

And run the install script to configure the GPU, install Anaconda and Theano by:

    bash setup_all.sh

See The section below if you already have Anaconda Python installed.  
If everything went well then the script ends by testing Theano on the GPU and the final line should read `Used the gpu`. To continue, either run `source ~/.bashrc` to update your current terminal, or restart your SSH session by entering `exit` and restart the connection by the above SSH command.


### Anaconda Python is already installed
If you have Anaconda Python already installed you can either remove your previous installation and run the `setup_all.sh` script as above. Or you can configure the GPU by running the following from the `Stadius_GPU` directory:

    bash setup_GPU.sh
    source ~/.bashrc
    bash setup_theano.sh

### Explanation of the above commands

`bash <script_name>` runs the script with `<script_name>`, the source of these scrips should be documented and self explaining.

`source ~/.bashrc` runs your [`.bashrc`](http://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) confige file to update your current session with the changes made by the install. The install adds some configuration lines to your .bashrc file.


## Start a notebook that is accessible from your local machine

If you want to run you files directly on the server by copying them via [`scp`](http://www.hypexr.org/linux_scp_help.php) or [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) and editing them via [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)), [Nano](https://en.wikipedia.org/wiki/GNU_nano), or [Emacs](http://www.gnu.org/software/emacs/). But we provide an easier option to run your code via [IPython notebooks](http://ipython.org/notebook.html). 

You can start an IPython notebook on the remote sista-nc-3 server and tunnel it to the `<port_number>` of the local host by downloading the [`run_notebook.sh`](https://raw.githubusercontent.com/peterroelants/Stadius_GPU/master/Python/run_notebook.sh) script and running it from the downloaded folder by:

    bash run_notebook.sh <user_name> <port_number> 

With `<port_number>` the port used to host the notebook on the remote server, and for the tunnel on the login server, and to receive the incoming stream on the current localhost. This script is self documented, feel free to go over the code for more information.

Alternative you can run:

    ssh -A -t -L <port_nb>:localhost:<port_nb> <user_name>@ssh.esat.kuleuven.be ssh -A -t -L <port_nb>:localhost:<port_nb> sista-nc-3 "ipython notebook --no-browser --port=<port_nb>"

You can then go to `http://localhost:<port_number>/` in your local browser to start working on the IPython notebooks.

Close the terminal where you ran the `run_notebook.sh` script via ctrl-C and enter `y` if needed to close the IPython notebook and tunnel.


### Debugging

Sometimes it is the case that an SSH connection doesn't close well, and is still running in the background, a process fails, or a port is in use. We will list a few commands that might be useful for debugging purposes.

These debugging commands can be useful on the local host as well as on the remote hosts. Run `ssh <user_name>@ssh.esat.kuleuven.be`, with `<user_name>` your user name, to log in to the gateway node, and run `ssh <user_name>@sista-nc-3` on the gateway node to log in on the sista-nc-3 server.

#### Debugging: listing all processing belonging to the current user

The [ps](http://www.westwind.com/reference/os-x/commandline/admin.html) command can be used to list processes running on the system. The list of processes belonging to the current user (you) can be found with.

    ps -x

And the list of all SSH processes belonging to the current user can be get with:

    ps -x | grep ssh

Where `|` creates a ['pipe'](http://www.linfo.org/pipes.html) that sends the output to the [grep](http://unixhelp.ed.ac.uk/CGI/man-cgi?grep) command that can extract and print the lines that contain a certain pattern (here the pattern is `ssh`). Thus for example `ps -x | grep python` can be used to list all Python processes by the current user.

The first column is the [process identification number](http://www.linfo.org/pid.html) (pid) which can be used to target the process in a `kill` command.

#### Debugging: killing processes

If you want to kill one of your processes then you can do this via the [kill](http://linux.die.net/man/1/kill) command:

    kill -9 <pid>

With `<pid>` the [process identification number](https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux) (see above on how to get this).


## Setup Anaconda Accelerate

Besides Theano you can also use [Anaconda Accelerate](https://store.continuum.io/cshop/accelerate/)'s [NumbaPro](http://docs.continuum.io/numbapro/) library to perform GPU computations via Python. NumbaPro is a paid package in Anaconda, but is free for academic usage. You can request your free license with your Stadius email [here](https://store.continuum.io/cshop/academicanaconda). You will receive the license file via email, download this file and copy it to the `~/.continuum` folder on your statius home directory. First create the `~/.continuum` folder with [`mkdir`](http://unixhelp.ed.ac.uk/CGI/man-cgi?mkdir) if this doesn't exist yet by:

    ssh <user_name>@ssh.esat.kuleuven.be "mkdir -p ~/.continuum"

Then copy this file via [secure copy](http://docstore.mik.ua/orelly/networking_2ndEd/ssh/ch07_05.htm) by:

    scp ./<licence_file> <user_name>@ssh.esat.kuleuven.be:~/.continuum/

Next install Anaconda Accelerate by logging into the sista-nc-3 server and running the following command in the remote shell (follow the installer instructions):

    conda update conda
    conda install accelerate


### Run Anaconda Accelerate

You can start a notebook server as was illustrated above. Next you can run [this example notebook](NumbaPro_example.ipynb). By navigating to `Stadius_GPU/Python` and opening the `NumbaPro_example.ipynb` file in the notebook application.
