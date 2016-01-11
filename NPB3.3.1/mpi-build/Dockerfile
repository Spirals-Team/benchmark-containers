FROM spirals/npb3.3.1:source

WORKDIR /home/NPB3.3.1/NPB3.3-MPI

# Get help files, compilation script, build configuration and run script
RUN mkdir help
COPY generator run ./
COPY help ./help
COPY make.def ./config

ENV PATH /usr/bin/:/home/bin:$PATH

# Define a build argument
ARG PROC_NB

# Install needed libraries for NPB MPI build, generate the build suite, build, and remove sources
RUN apt-get update && apt-get install -y\
  make\
  gcc\
  g++\
  gfortran\
  mpich\
  bc\
&& ./generator $PROC_NB \
&& make suite \
&& make clean \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./run"]

