# How to use the Stadius GPU

The Stadius sista-nc-3 server has a [Tesla K40 GPU](http://www.nvidia.com/content/PDF/kepler/Tesla-K40-PCIe-Passive-Board-Spec-BD-06902-001_v05.pdf) donated by NVIDIA that can be used by researchers in the [Stadius](http://www.esat.kuleuven.be/stadius/) research group. This Github page will explain how to use this GPU via libraries such as [Theano](http://deeplearning.net/software/theano/), and will give you pointers where and how to learn more about GPU programming.

## What is GPU computing

[GPU-accelerated computing](http://www.nvidia.com/object/what-is-gpu-computing.html) is the use of a graphics processing unit (GPU) to accelerate certain computations. GPUs can gain speedups over a CPU because of their highly parallel architecture. The following picture illustrates this difference in parallelization. While a CPU only has a few computational cores, the CPU typically has a few hundred. 

![CPU vs GPU](http://news.cnet.com/i/bto/20090401/nvidia-gpgpu-small.jpg)

While a single GPU core is typically much more limited in what it can do and is much slower than a CPU core, a usage of many cores in parallel can still give certain speedups over sequential CPU programs. The speedup that can be gained is depended on the problem you are trying to solve, if your problem can be parallelized easily your speedups can be huge. If you problem is almost completely sequential, almost no speedups can be made, and your program might even run slower. Typical linear algebra equations are a good candidate to parallelize because of the parallel nature of vector additions and multiplications.


## Setup Anaconda Python and Theano

To set up the [Anaconda Python](https://store.continuum.io/cshop/anaconda/) distribution in your home directory and install the [Theano](http://deeplearning.net/software/theano/) library you can follow the following steps (please read through this full section before executing the steps.)

Login to the sista-nc-3 server with your Stadius account by executing the following command in your shell (be sure that [SSH](http://unixhelp.ed.ac.uk/CGI/man-cgi?ssh+1) is installed and configured, if you don't know how to do this, ask your nearest colleague):

    ssh -A -t <user_name>@ssh.esat.kuleuven.be ssh -A -t sista-nc-3

With `<user_name>` your user name. This might ask you password corresponding to your user name.  
Then download this Github repository via git by running the following command on the server side terminal (the one you just logged into):

    git clone https://github.com/peterroelants/Stadius_GPU.git

Go to the `Stadius_GPU` directory that is just created by:

    cd Stadius_GPU/

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

The `ssh -A -t <user_name>@ssh.esat.kuleuven.be ssh -A -t sista-nc-3` command  will create a [multi-hop](http://sshmenu.sourceforge.net/articles/transparent-mulithop.html) SSH connection to `sista-nc-3` by first going through the `ssh.esat.kuleuven.be` login server. The `-A` option forwards your user name to `sista-nc-3` via `ssh.esat.kuleuven.be` without needing it again. The `-t` option forces to open a terminal on `sista-nc-3`. The result of this command will be the same as first running `ssh <user_name>@ssh.esat.kuleuven.be` and then `ssh <user_name>@sista-nc-3`.

`git clone https://github.com/peterroelants/Stadius_GPU.git` Uses [Git](https://git-scm.com/)'s' [clone](http://git-scm.com/docs/git-clone) command to download the necessary files in [https://github.com/peterroelants/Stadius_GPU](https://github.com/peterroelants/Stadius_GPU).

`bash <script_name>` runs the script with `<script_name>`, the source of these scrips should be documented and self explaining.

`source ~/.bashrc` runs your [`.bashrc`](http://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) confige file to update your current session with the changes made by the install. The install adds some configuration lines to your .bashrc file.


## Start a notebook that is accessible from your local machine

If you want to run you files directly on the server by copying them via [`scp`](http://www.hypexr.org/linux_scp_help.php) or [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) and editing them via [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)), [Nano](https://en.wikipedia.org/wiki/GNU_nano), or [Emacs](http://www.gnu.org/software/emacs/). But we provide an easier option to run your code via [IPython notebooks](http://ipython.org/notebook.html). 

You can start an IPython notebook on the remote sista-nc-3 server and tunnel it to the `<port_number>` of the local host via:

    bash run_notebook.sh <user_name> <port_number> 

With `<port_number>` the port used to host the notebook on the remote server, and for the tunnel on the login server, and to receive the incoming stream on the current localhost. This script is self documented, feel free to go over the code for more information.

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



## Using Matlab with GPU on the server

In Stadius the [Matlab](http://nl.mathworks.com/products/matlab/) version comes with the [Parallel Computing Toolbox](http://nl.mathworks.com/products/parallel-computing/). This toolbox allows to use the GPU if there is one available, and since the sista-nc-3 server has one available we can make use of it.

[Learn more about Matlab GPU computing.](http://nl.mathworks.com/discovery/matlab-gpu.html)


X = rand(2000,20)*rand(20,5000);
tic
opt = statset('Maxiter',1000,'Display','final');
[W,H] = nnmf(X,5,'options',opt,'algorithm','als');
toc


G = gpuArray(X);
tic
opt = statset('Maxiter',1000,'Display','final');
opt.UseParallel = true;
[W,H] = nnmf(G,5,'options',opt,'algorithm','als');
toc



https://developer.nvidia.com/how-to-cuda-python





ssh -M -S nb-ctrl-socket -A -f -L 7777:localhost:7777 proelant@ssh.esat.kuleuven.be ssh -A -L 7777:localhost:7777 -N sista-nc-3

ssh -S nb-ctrl-socket -O check proelant@ssh.esat.kuleuven.be
ssh -S nb-ctrl-socket -O check proelant@sista-nc-3

ssh -S nb-ctrl-socket -O exit proelant@ssh.esat.kuleuven.be
ssh -S nb-ctrl-socket -O exit proelant@sista-nc-3

