# MiKTeX test suite

## What you will find here

This readme file is located in the top-level directory of the MiKTeX
test suite.

Use the test suite to validate your MiKTeX setup.

## Prerequisites

* MiKTeX

  MiKTeX must be configured to use A4 paper.

* CMake

  The tests are executed by the Make utility.  You use CMake to create
  Makefiles suited for your local system.

* Various utilities

  In addition to MiKTeX, Make and CMake, you will need these
  utilities:

  * diff
  * gzip
  * md5sum
  * pandoc
  * pdfinfo
  * pdftoppm
  * touch
  * unzip

## Running CMake

It is recommended that the Makefiles are written into a separate
directory. Create a new directory for testing and cd there.  When you
invoke CMake, you have to specify the the source directory of the test
suite.  Like this:

    mkdir miktex-test
    cd miktex-test
    cmake PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
CMake for Windows may require a generator specification.  If you want
to generate Makefiles for `nmake`, run this:

    cmake -G "NMake Makefiles" PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
It is assumed that MiKTeX executables can be found on your system.  If
this is not the case, you have to set the variable `MIKTEX_BINARY_DIR`
as follows:

    cmake -DMIKTEX_BINARY_DIR=PATH-TO-MIKTEX_BINARY-DIR PATH-TO-MIKTEX-TEST-SOURCE-DIR
	
## Running the tests

CMake creates a `test` target which you can use to run the tests:

    make test
