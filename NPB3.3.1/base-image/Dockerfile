FROM ubuntu:xenial

ADD http://www.nas.nasa.gov/assets/npb/NPB3.3.1.tar.gz /home

RUN cd /home \
&& tar xf NPB3.3.1.tar.gz \
&& rm NPB3.3.1.tar.gz

WORKDIR /home/NPB3.3.1
