#!/usr/bin/env sh

set -e
set -v

curl --location --output miktex-2.9.6700-1-darwin-x86_64.dmg https://miktex.org/download/ctan/systems/win32/miktex/setup/darwin-x86_64/miktex-2.9.6700-1-darwin-x86_64.dmg
echo Y | hdiutil attach miktex-2.9.6700-1-darwin-x86_64.dmg
ls -l /Volumes/miktex-2.9.6700-1-darwin-x86_64


miktex_bin="/Volumes/miktex-2.9.6700-1-darwin-x86_64/MiKTeX Console.app/Contents/bin"
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

~/bin/miktexsetup finish
~/bin/initexmf --set-config-value=[MPM]AutoInstall=1
~/bin/mpm --package-level=basic --upgrade

rm -fr "${miktex_home}"
