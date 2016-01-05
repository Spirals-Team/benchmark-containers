FROM debian:latest

RUN mkdir /home/parsec-3.0

# Copy scripts for getting build configurations, building parsec and running parsec, as well as help text file  
COPY getCompilConf.sh build.sh run.sh pod.patch uptcpip.patch /home/parsec-3.0/

# Install needed libraries for Parsec build, download, untar, compile and clean Parsec folder
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
&& wget -nv -P /home/parsec-3.0 http://parsec.cs.princeton.edu/download/3.0/parsec-3.0.tar.gz \  
&& tar -C /home/ -xvf /home/parsec-3.0/parsec-3.0.tar.gz \
&& rm /home/parsec-3.0/parsec-3.0.tar.gz \
&& cd /home/parsec-3.0 \
&& patch -p1 < pod.patch \
&& patch -p1 < uptcpip.patch \
&& find /home/parsec-3.0/ -name \*.tar -exec xz -9 \{\} \; \
&& sh /home/parsec-3.0/getCompilConf.sh \
&& sh /home/parsec-3.0/build.sh \
&& /home/parsec-3.0/bin/parsecmgmt -a fullclean -p all \
&& cd /home/parsec-3.0 \
&& rm -rf build.sh getCompilConf.sh compilConf.txt pod.patch uptcpip.patch log man toolkit \
&& rm -rf pkgs/libs pkgs/tools \
&& rm -rf ext/splash2/README.SPLASH2 ext/splash2/SPLASH2.POSTING ext/splash2/null_macros \
&& find 'pkgs' -depth -mindepth 3 -maxdepth 3 -not -name inputs -not -name inst -not -name parsec -exec rm -rf \{\} \; \
&& find 'ext' -depth -mindepth 4 -maxdepth 4 -not -name inputs -not -name inst -not -name parsec -exec rm -rf \{\} \;

WORKDIR /home/parsec-3.0

# Define default behavior at container launch
ENTRYPOINT ["./run.sh"]

