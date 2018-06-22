#!/usr/bin/env sh

set -e
set -v

curl --location --output miktex-2.9.6700-1-darwin-x86_64.dmg https://miktex.org/download/ctan/systems/win32/miktex/setup/darwin-x86_64/miktex-2.9.6700-1-darwin-x86_64.dmg
echo Y | hdiutil attach miktex-2.9.6700-1-darwin-x86_64.dmg
ls -l /Volumes/miktex-2.9.6700-1-darwin-x86_64
