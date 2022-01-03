#!/usr/bin/env bash
modules=$(\
find src/my -name \*.lua ! -name '*example*' \
| sed 's/src.//g' \
| sed 's/\//./g' \
| sed 's/.lua//g')

luacc \
-i ./src rc $modules \
-o out/rc.lua

source env.sh
cp -r \
awesome/* out/* \
$awesomeConfigDir
