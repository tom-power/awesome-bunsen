#!/usr/bin/env bash
modules=$(find src/my -name \*.lua ! -name '*example*' | sed 's/\//./g' | sed 's/src.//g' | sed 's/.lua//g' )

luacc -i ./src rc $modules -o out/rc.lua

source local/env.sh

cp -r awesome/* $awesomeConfigDir
cp out/rc.lua $awesomeConfigDir
