FROM debian:latest
MAINTAINER Ouamar Sais

#Set the current directory to /tmp
WORKDIR /tmp 

#Copy scripts for getting build configurations, building parsec and running parsec, as well as help text file  
COPY getCompilConf.sh build.sh run.sh help.txt htu.txt pod.patch uptcpip.patch /home/

#Install needed libraries for Parsec build, download, untar, and delete Parsec archive
RUN apt-get clean && apt-get update && apt-get install -y \
	g++ \
	gettext\
	libtbb-dev\
	m4\
	make\
	patch\
	wget\
	xorg-dev\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& wget -nv http://192.168.0.11:8888/Docker/parsec-3.0.tar.gz \  
&& tar -xvf /tmp/parsec-3.0.tar.gz \
&& mv /tmp/parsec-3.0 /home/ \
&& rm /tmp/parsec-3.0.tar.gz \
&& find /home/ -maxdepth 1 -type f -exec mv {} /home/parsec-3.0 \; \
&& cd /home/parsec-3.0 \
&& patch -p1 < pod.patch \
&& patch -p1 < uptcpip.patch \
&& find /home/parsec-3.0/ -name \*.tar -exec xz -9 \{\} \; \
&& sh /home/parsec-3.0/getCompilConf.sh \
&& sh /home/parsec-3.0/build.sh \
&& /home/parsec-3.0/bin/parsecmgmt -a fullclean \
&& rm getCompilConf.sh build.sh pod.patch uptcpip.patch

#Set current directory to /home/parsec-3.0
WORKDIR /home/parsec-3.0

#Define default behavior at container launch
#ENTRYPOINT ["./run.sh"]
CMD ["help"]






