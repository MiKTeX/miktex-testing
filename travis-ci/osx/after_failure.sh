#!/usr/bin/env sh

set -v

miktex_home="$HOME/Library/Application Support/MiKTeX"

if [ -d "$miktex_home/texmfs/data/miktex/log" ]; then
    (cd "$miktex_home/texmfs/data/miktex/log"; cat *)
fi

if [ -f "${TRAVIS_BUILD_DIR}/build/Testing/Temporary/LastTest.log" ]; then
    cat "${TRAVIS_BUILD_DIR}/build/Testing/Temporary/LastTest.log"
fi
