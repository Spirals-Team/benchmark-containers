FROM spirals/iozone3.434:source

WORKDIR /home/iozone3_434/src/current/

# Install needed libraries for building, build, and remove sources
RUN make linux-AMD64 \
&& find . ! -name 'iozone' -type f -exec rm -f \{\} \; \
&& rm -rf ../../docs

ENTRYPOINT ["./iozone"]

