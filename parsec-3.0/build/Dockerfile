FROM spirals/parsec-3.0:source

# Copy scripts for getting build configurations, building parsec and running parsec  
COPY getCompilConf build run /home/parsec-3.0/

#Install needed libraries for Parsec build
RUN apt-get update && apt-get install -y \
        g++ \
        gettext\
        libtbb-dev\
        m4\
        make\
        xorg-dev\
&& /home/parsec-3.0/getCompilConf \
&& /home/parsec-3.0/build \
&& /home/parsec-3.0/bin/parsecmgmt -a fullclean -p all \
&& rm -f /home/parsec-3.0/build /home/parsec-3.0/getCompilConf /home/parsec-3.0/compilConf.txt \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /home/parsec-3.0

ENTRYPOINT ["./run"]

