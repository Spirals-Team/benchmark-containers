## NPB3.3.1-MPI 
### Overview

Docker version of [NPB3.3.1-MPI](https://www.nas.nasa.gov/publications/npb.html) benchmark suite.

This docker image contains all built benchmarks (MPI version) for 1 to `PROC_NB` processors, when possible. 

A default image built for benchmarks using 1 to 32 processors is published with the `spirals/npb3.3.1:mpi-build` tag.

### Usage

This image has to be used in a non-interactive mode—*i.e.*, all the benchmarks can be directly launched by using the command `docker run`.

For more details, use `docker run spirals/npb3.3.1:mpi-build --help`.

### Build information

This docker image can be built upon needs.

`docker build -t [repository/tag] --build-arg PROC_NB=[#PROC_NB] .`, for building an image for benchmarks using 1 to `#PROC_NB` processors.

