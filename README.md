# single-etcd

You want to test out some software that uses etcd.  Your software is in a 
Docker container.  Etcd has a Docker container build.  What could go wrong?

Unfortunately, the official etcd Docker image is designed to run port-mapped
to the host.  But you just want your test environment to run in a Docker 
network, like the default bridge without hairpinning to the host IP.

Worse, launching the image requires you to pass the host's name or IP address,
 making it super hard to write portable continuous integration scripts.

This Docker image is for you!

It wraps the etcd binary in a script that auto-detects the right IP address and
passes that to etcd startup variables.

Example Docker-compose file for testing:

    etcd:
      image: spikecurtis/single-etcd

    my-software
      image: myname/my-software
      links:
        - etcd
      command: run-tests --etcd=http://etcd:4001
