# MiKTeX test suite

## What you will find here

This readme file is located in the top-level directory of the MiKTeX
test suite.

Use the test suite test your MiKTeX setup.

## Prerequisites

* MiKTeX

  The path to the MiKTeX installation directory must not contain
  spaces.  This is a CMake limitation.

* CMake

  The tests are executed by make(1).  You use CMake to create
  Makefiles suited for your local system.

* Various utilities

  In addition to MiKTeX and CMake, you will need these utilities:

  * ImageMagick (convert)
  * diff
  * gzip
  * md5sum
  * pandoc
  * unzip

## Running CMake

It is recommended, that the Makefiles are written into a separate
directory.  When you invoke CMake, you have to specify the the source
directory of the test suite.  Like this:

    cmake PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
CMake for Windows may require a generator specification.  If you want
to generate Makefiles for `nmake`, run this:

    cmake -G "NMake Makefiles" PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
It is assumed that MiKTeX executables can be found via the environment
variable `PATH`.  If this is not the case, you have to set the
variable `MIKTEX_BINARY_DIR` as follows:

    cmake -DMIKTEX_BINARY_DIR=PATH-TO-MIKTEX_BINARY-DIR PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
## Running the tests

CMake creates a `test` target which you can use to run the tests:

    make test
