# SSH tunneling through gateway (multi-hop)

* http://sshmenu.sourceforge.net/articles/transparent-mulithop.html
$ http://superuser.com/questions/96489/ssh-tunnel-via-multiple-hops
* http://tom.scogland.com/blog/2012/07/04/ssh-tricks/
* http://www.g-loaded.eu/2006/11/24/auto-closing-ssh-tunnels/
* http://blog.trackets.com/2014/05/17/ssh-tunnel-local-and-remote-port-forwarding-explained-with-examples.html
* https://gist.github.com/scy/6781836
* https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts

ssh -A -t ruapehu.example.com ssh -A -t aoraki ssh -A tongariro

ssh proelant@sista-nc-3
ssh proelant@ssh.esat.kuleuven.be


ssh -A -t proelant@ssh.esat.kuleuven.be ssh -A -t sista-nc-3


# Access IPython notebook over SSH

* http://wisdomthroughknowledge.blogspot.com/2012/07/accessing-ipython-notebook-remotely.html
* https://coderwall.com/p/ohk6cg/remote-access-to-ipython-notebooks-via-ssh
* http://www.hydro.washington.edu/~jhamman/hydro-logic/blog/2013/10/04/pybook-remote/
* http://stackoverflow.com/questions/22518489/using-ipython-notebook-remotely-by-ssh-twice

host1=username@login_node.com
  host2=username@dest.ination.com
  ssh -L 7777:localhost:7777 $host1 ssh -L 7777:localhost:7777 -N $host2





ssh -A -t -L 7777:localhost:7777 proelant@ssh.esat.kuleuven.be ssh -A -t -L 7777:localhost:7777 -N sista-nc-3




https://developer.nvidia.com/how-to-cuda-python