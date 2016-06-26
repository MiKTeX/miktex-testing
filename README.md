## MiKTeX testing

This is the MiKTeX test suite.

### Creating the Makefiles

You use CMake to create the Makefiles. It is recommended, that the Makefiles are written into a
separate directory:

    cmake -G "NMake Makefiles" -DMIKTEX_BINARY_DIR=C:/MiKTeX/miktex/bin PATH-TO-TEST-SOURCE-DIR

The path to the binary dir (MIKTEX_BINARY_DIR) must not contain spaces. This is a CMake limitation.

### Running the tests

    nmake test
