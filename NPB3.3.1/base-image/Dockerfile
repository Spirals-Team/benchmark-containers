FROM ubuntu:latest

WORKDIR /home

# Install required libraries, download benchmark suite and untar files
RUN apt-get update && apt-get install -y \
  wget \
&& wget -nv http://www.nas.nasa.gov/assets/npb/NPB3.3.1.tar.gz \
&& tar -xf NPB3.3.1.tar.gz \
&& rm NPB3.3.1.tar.gz \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/NPB3.3.1

