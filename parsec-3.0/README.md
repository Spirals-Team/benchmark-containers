## PARSEC, SPLASH2 & SPLASH2X

Docker version of [PARSEC 3.0 and SPLASH2/SPLASH2x](http://parsec.cs.princeton.edu) benchmark suites.

This docker image contains all built benchmarks and all inputs (`test`, `simdev`, `simsmall`, `simmedium`, `simlarge`, `native`).

Each benchmark has been compiled for each available configuration (`gcc`, `gcc-hooks`, `gcc-serial`, `gcc-openmp`, `gcc-pthreads`, `gcc-tbb`).

In order to provide a lightweight image, each input has been compressed and the [source code](http://parsec.cs.princeton.edu/download.htm#parsec) has been removed from the image.

This image has to be used in a non-interactive mode—i.e., all the benchmarks can be directly launched by using the command `docker run`.

All the available commands for PARSEC and SPLASH2/SPLASH2X are described by the `parsecmgmt` command (`docker run spirals/parsec-3.0`).

For listing all compiled benchmarks, use `docker run spirals/parsec-3.0 -a status`.

The default command is extended with -S option for providing the suite (`parsec`, `splash2`, `splash2x`) to which the package belongs (some benchmarks are available in different suites).
It can be replaced by using the full name of the package instead.

