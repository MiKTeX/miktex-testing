#!/usr/bin/env sh

set -e
set -v

url=http://miktex.org/download/mac/miktex-x64.dmg

curl --insecure --location --output miktex.dmg $url
echo Y | hdiutil attach miktex.dmg

contents="/volumes/MiKTeX/MiKTeX Console.app/Contents"
miktex_bin="$contents/bin"

"${miktex_bin}/miktexsetup" --verbose finish
"${miktex_bin}/initexmf" --verbose --set-config-value=[MPM]AutoInstall=1
"${miktex_bin}/mpm" --verbose --package-level=basic --upgrade

"$contents/MacOS/MiKTeX Console" --version

cd "${TRAVIS_BUILD_DIR}"
mkdir build
cd build

cmake -DMIKTEX_BINARY_DIR="$miktex_bin" ..

make test
