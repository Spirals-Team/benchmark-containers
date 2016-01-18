FROM debian:latest

RUN mkdir /home/parsec-3.0

# Copy scripts for getting patches
COPY pod.patch uptcpip.patch netdedup-runconf.patch netdedup-run.patch /home/parsec-3.0/

# Install needed libraries for Parsec download, untar, patch and clean Parsec folder
RUN apt-get clean && apt-get update && apt-get install -y \
	patch\
	wget\
        xz-utils\
&& wget -nv -P /home/parsec-3.0 http://parsec.cs.princeton.edu/download/3.0/parsec-3.0.tar.gz \
&& tar -C /home/ -xvf /home/parsec-3.0/parsec-3.0.tar.gz \
&& rm /home/parsec-3.0/parsec-3.0.tar.gz \
&& patch -d /home/parsec-3.0 -p1 < /home/parsec-3.0/netdedup-runconf.patch \
&& patch -d /home/parsec-3.0 -p1 < /home/parsec-3.0/netdedup-run.patch \
&& patch -d /home/parsec-3.0 -p1 < /home/parsec-3.0/pod.patch \
&& patch -d /home/parsec-3.0 -p1 < /home/parsec-3.0/uptcpip.patch \
&& rm /home/parsec-3.0/pod.patch /home/parsec-3.0/uptcpip.patch /home/parsec-3.0/netdedup-run.patch /home/parsec-3.0/netdedup-runconf.patch \
&& find /home/parsec-3.0/ -name \*.tar -exec xz -9 \{\} \; \
# Create missing symbolic links for network packages
&& cd /home/parsec-3.0/pkgs/netapps/netdedup && ln -sf ../../kernels/dedup/inputs \
&& cd /home/parsec-3.0/pkgs/netapps/netferret && ln -sf ../../apps/ferret/inputs \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/parsec-3.0

