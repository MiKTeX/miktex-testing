#!/usr/bin/env sh

set -e
set -v

url=http://miktex.org/download/mac/miktex-x64.dmg

curl --insecure --location --output miktex.dmg $url
echo Y | hdiutil attach miktex.dmg

MIKTEX_VERSION=2.9.6800

contents="/volumes/miktex-$MIKTEX_VERSION-1-darwin-x86_64/MiKTeX Console.app/Contents"
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
