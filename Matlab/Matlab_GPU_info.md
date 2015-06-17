# Using Matlab with GPU on the server

In Stadius the [Matlab](http://nl.mathworks.com/products/matlab/) version comes with the [Parallel Computing Toolbox](http://nl.mathworks.com/products/parallel-computing/). This toolbox allows to use the GPU if there is one available, and since the sista-nc-3 server has one available we can make use of it.

## Running matlab on the server

To run Matlab from the sista-nc-3 server, first login to this server via SSH:

    ssh -AtX <user_name>@ssh.esat.kuleuven.be ssh -AtX sista-nc-3 "matlab -desktop"

With `<user_name>` your Stadius user name. the `-X` option of the ssh command should enable [X-window forwarding](http://www.vanemery.com/Linux/XoverSSH/X-over-SSH2.html).

You can then run matlab via the GUI by running

    matlab -desktop

in the remote terminal. You can run `matlab -nojvm` if you don't need a GUI. More information about running Matlab on the servers can be found on the [Stadius intranet](https://securewww.esat.kuleuven.be/escd/Info_functions.php?action=view_topic&topicnr=39).

Once you have a Matlab terminal you can run the [`gpuDevice`](http://nl.mathworks.com/help/distcomp/gpudevice.html) command to view the properties of the GPU.


## Simple example Calculating the Mandelbrot set

The [Matlab/Mandlebrot_GPU_illustration.m](Mandlebrot_GPU_illustration.m) file in this repository illustrates simple an naive usage and the increase in performance that can be gained. This script is based upon a more extensive illustration of GPU usage: [http://nl.mathworks.com/help/distcomp/examples/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html](http://nl.mathworks.com/help/distcomp/examples/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html). Go over these examples to learn more about GPU usage on Matlab.

You can run this script in Matlab by navigating to the `Stadius_GPU/Matlab/Mandlebrot_GPU_illustration.m` directory in matlab and running the script. You will notice that even a small change in the source can already provide a 10-fold speedup.

The speedup in this example is gained by copying the input data to the memory of the GPU with the [`gpuArray`](http://nl.mathworks.com/help/distcomp/gpuarray.html) command. By just copying the data to the GPU's memory it can be run with the help of this GPU. This is only a naive way of speeding up the computation, for better speed improvements please go over the [tutorial on the Matlab website](http://nl.mathworks.com/help/distcomp/examples/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html).

## More info about GPU computation with Matlab

Matlab provides an [overview](http://nl.mathworks.com/discovery/matlab-gpu.html) of GPU computing that can be done in Matlab, together with some introductory videos and examples. Many of Matlab's [build-in functions](http://nl.mathworks.com/help/distcomp/run-built-in-functions-on-a-gpu.html) support gpuArray elements.

Two more introductions to Matlab GPU programming can be found at: [GPU Programming in MATLAB](http://nl.mathworks.com/company/newsletters/articles/gpu-programming-in-matlab.html) and at [Using GPUs in MATLAB](http://blogs.mathworks.com/loren/2012/02/06/using-gpus-in-matlab/).