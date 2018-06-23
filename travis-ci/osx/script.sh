#!/usr/bin/env sh

set -e
set -v

version=2.9.6715

curl --location --output miktex-$version-1-darwin-x86_64.dmg https://miktex.org/download/ctan/systems/win32/miktex/setup/darwin-x86_64/miktex-$version-1-darwin-x86_64.dmg
echo Y | hdiutil attach miktex-$version-1-darwin-x86_64.dmg

miktex_bin="/Volumes/miktex-$version-1-darwin-x86_64/MiKTeX Console.app/Contents/bin"

"${miktex_bin}/miktexsetup" finish
"${miktex_bin}/initexmf" --set-config-value=[MPM]AutoInstall=1
"${miktex_bin}/mpm" --package-level=basic --upgrade

cd "${TRAVIS_BUILD_DIR}"
mkdir build
cd build

cmake -DMIKTEX_BINARY_DIR="$miktex_bin" ..

make test
