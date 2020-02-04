#!/usr/bin/env sh

set -e
set -v

brew update

#brew outdated cmake || brew upgrade cmake

( brew ls -1 | grep -w ghostscript ) || brew install ghostscript
( brew ls -1 | grep -w md5sha1sum ) || brew install md5sha1sum
