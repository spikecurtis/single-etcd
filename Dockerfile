FROM ubuntu
MAINTAINER Spike Curtis <spike@projectcalico.org>

ADD wrapetcd /root/
ADD etcd /usr/bin/
WORKDIR /root

CMD ["./wrapetcd"]