## PARSEC, SPLASH2 & SPLASH2X
### Overview
Docker version of [PARSEC 3.0 and SPLASH2/SPLASH2x](http://parsec.cs.princeton.edu) benchmark suites.

This docker image contains all built benchmarks and all inputs (`test`, `simdev`, `simsmall`, `simmedium`, `simlarge`, `native`).

Each benchmark has been compiled for each available configuration (`gcc`, `gcc-hooks`, `gcc-serial`, `gcc-openmp`, `gcc-pthreads`, `gcc-tbb`).

In order to provide a lightweight image, each input has been compressed and the [source code](http://parsec.cs.princeton.edu/download.htm#parsec) has been removed from the image.

### Usage
This image has to be used in a non-interactive mode—*i.e.*, all the benchmarks can be directly launched by using the command `docker run`.

All the available commands for this container conform to the `parsecmgmt` [command](http://parsec.cs.princeton.edu/doc/man/man1/parsecmgmt.1.html) (`docker run spirals/parsec-3.0`). For example, please use `docker run spirals/parsec-3.0 -a status` to list all the compiled benchmarks.

The default command is extended with option `-S` to specify the suite (`parsec`, `splash2`, `splash2x`) to which the selected package belongs (some benchmarks are available in different suites).
It can be replaced by using the full name of the package instead.
