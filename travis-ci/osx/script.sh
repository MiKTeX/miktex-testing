#!/usr/bin/env sh

set -e
set -v

version=2.9.6730
dmg_name=miktex-$version-1-darwin-x86_64
dmg=$dmg_name.dmg
url=https://miktex.org/download/ctan/systems/win32/miktex/setup/darwin-x86_64/$dmg

curl --location --output $dmg $url
echo Y | hdiutil attach $dmg

contents="/Volumes/$dmg_name/MiKTeX Console.app/Contents"
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
