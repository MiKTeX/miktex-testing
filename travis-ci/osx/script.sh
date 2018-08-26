#!/usr/bin/env sh

set -e
set -v

url=https://miktex.org/download/mac/miktex-x64.dmg

curl --location --output miktex.dmg $url
echo Y | hdiutil attach miktex.dmg

contents="/Volumes/miktex*/MiKTeX Console.app/Contents"
miktex_bin="$contents/bin"

"${miktex_bin}/miktexsetup" finish
"${miktex_bin}/initexmf" --set-config-value=[MPM]AutoInstall=1
"${miktex_bin}/mpm" --package-level=basic --upgrade

"$contents/MacOS/MiKTeX Console" --version

cd "${TRAVIS_BUILD_DIR}"
mkdir build
cd build

cmake -DMIKTEX_BINARY_DIR="$miktex_bin" ..

make test
