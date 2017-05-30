FROM spirals/npb3.3.1:source

WORKDIR /home/NPB3.3.1/NPB3.3-MPI

# Get help files, compilation script, build configuration and run script
COPY . ./

# Define NB_PROC as build argument (default: 32 CPU)
ARG NB_PROC=32

# Install needed libraries for NPB MPI build, generate the build suite, build, and remove unneeded packages
RUN apt-get update && apt-get install -y build-essential mpich \
&& perl suite_generator.pl $NB_PROC >config/suite.def && make suite && make clean \
&& apt-get remove -y build-essential && apt-get -y autoclean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./run"]
