#!/usr/bin/env sh

set -e
set -v

curl --location --output miktex-2.9.6715-1-darwin-x86_64.dmg http://download.miktex.org/tmp/6A8D5E99E29F48209C541EFAFD88F0C5/miktex-2.9.6715-1-darwin-x86_64.dmg
echo Y | hdiutil attach miktex-2.9.6715-1-darwin-x86_64.dmg
ls -l /Volumes/miktex-2.9.6715-1-darwin-x86_64


miktex_bin="/Volumes/miktex-2.9.6715-1-darwin-x86_64/MiKTeX Console.app/Contents/bin"
miktex_home="$HOME/Library/Application Support/MiKTeX"

sudomiktex() {
    set +e
    sudo MIKTEX_SHAREDSETUP=t "$miktex_bin"/$1 $2 $3 $4 $5 $6 $7 $8 $9
    local status=$?
    if [ $status -ne 0 ]; then
	if [ -d "$miktex_home/texmfs/data/miktex/log" ]; then
	    cd "$miktex_home/texmfs/data/miktex/log"
	    grep FATAL *
	fi
	if [ -d "/var/log/miktex" ]; then
	    cd "/var/log/miktex"
	    grep FATAL *
	fi
    fi
    set -e
    return $status
}

"${miktex_bin}/miktexsetup" finish
"${miktex_bin}/initexmf" --set-config-value=[MPM]AutoInstall=1
"${miktex_bin}/mpm" --package-level=basic --upgrade

cd "${TRAVIS_BUILD_DIR}"
mkdir build
cd build

cmake -DMIKTEX_BINARY_DIR="$miktex_bin" ..

#export MIKTEX_TRACE=error
make test
