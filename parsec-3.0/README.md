## PARSEC, SPLASH2 & SPLASH2X
### Overview
Docker version of [PARSEC 3.0 and SPLASH2/SPLASH2x](http://parsec.cs.princeton.edu) benchmark suites.

This repository contains the source code for building two different images.

The first one represents the source code (`base-image` folder) image and it contains all available inputs (`test`, `simdev`, `simsmall`, `simmedium`, `simlarge`, `native`).
In order to provide a lightweight image, each input has been compressed.

The second one (`parsec-build` folder) represents the self-running image.
Each benchmark has been compiled for each available configuration (`gcc`, `gcc-hooks`, `gcc-serial`, `gcc-openmp`, `gcc-pthreads`, `gcc-tbb`).

