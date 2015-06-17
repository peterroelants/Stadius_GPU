# How to use the Stadius GPU

The Stadius sista-nc-3 server has a [Tesla K40 GPU](http://www.nvidia.com/content/PDF/kepler/Tesla-K40-PCIe-Passive-Board-Spec-BD-06902-001_v05.pdf) donated by NVIDIA that can be used by researchers in the [Stadius](http://www.esat.kuleuven.be/stadius/) research group. This Github page will explain how to use this GPU via libraries such as [Theano](http://deeplearning.net/software/theano/), and will give you pointers where and how to learn more about GPU programming.

## What is GPU computing

[GPU-accelerated computing](http://www.nvidia.com/object/what-is-gpu-computing.html) is the use of a graphics processing unit (GPU) to accelerate certain computations. GPUs can gain speedups over a CPU because of their highly parallel architecture. The following picture illustrates this difference in parallelization. While a CPU only has a few computational cores, the CPU typically has a few hundred. 

![CPU vs GPU](http://news.cnet.com/i/bto/20090401/nvidia-gpgpu-small.jpg)

While a single GPU core is typically much more limited in what it can do and is much slower than a CPU core, a usage of many cores in parallel can still give certain speedups over sequential CPU programs. The speedup that can be gained is depended on the problem you are trying to solve, if your problem can be parallelized easily your speedups can be huge. If you problem is almost completely sequential, almost no speedups can be made, and your program might even run slower. Typical linear algebra equations are a good candidate to parallelize because of the parallel nature of vector additions and multiplications.

## Set up this tutorial

To set up this tutorial and copy the files you need to your home directory on the server you can follow the following steps.

Login to the sista-nc-3 server with your Stadius account by executing the following command in your shell (be sure that [SSH](http://unixhelp.ed.ac.uk/CGI/man-cgi?ssh+1) is installed and configured, if you don't know how to do this, ask your nearest colleague):

    ssh -A -t <user_name>@ssh.esat.kuleuven.be ssh -A -t sista-nc-3

With `<user_name>` your user name. This might ask you password corresponding to your user name.  
Then download this Github repository via git by running the following command on the server side terminal (the one you just logged into):

    git clone https://github.com/peterroelants/Stadius_GPU.git

### Explanation of the above commands

The `ssh -A -t <user_name>@ssh.esat.kuleuven.be ssh -A -t sista-nc-3` command  will create a [multi-hop](http://sshmenu.sourceforge.net/articles/transparent-mulithop.html) SSH connection to `sista-nc-3` by first going through the `ssh.esat.kuleuven.be` login server. The `-A` option forwards your user name to `sista-nc-3` via `ssh.esat.kuleuven.be` without needing it again. The `-t` option forces to open a terminal on `sista-nc-3`. The result of this command will be the same as first running `ssh <user_name>@ssh.esat.kuleuven.be` and then `ssh <user_name>@sista-nc-3`.

`git clone https://github.com/peterroelants/Stadius_GPU.git` Uses [Git](https://git-scm.com/)'s' [clone](http://git-scm.com/docs/git-clone) command to download the necessary files in [https://github.com/peterroelants/Stadius_GPU](https://github.com/peterroelants/Stadius_GPU).



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

