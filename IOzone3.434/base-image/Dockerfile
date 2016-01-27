FROM ubuntu:latest

WORKDIR /home

# Install required libraries, download benchmark suite and untar files
RUN apt-get update && apt-get install -y\
  wget\
  gcc \
  make\
&& wget http://iozone.org/src/current/iozone3_434.tar \
&& tar -xf iozone3_434.tar \
&& rm iozone3_434.tar \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
		
WORKDIR /home/iozone3_434/src/current/

