#!/usr/bin/env bash
path="/usr/local/lib/libfoo.so.1"
echo "${path##*/}"      # basename
echo "${path%/*}"       # dirname
echo "${path%%.*}"      # strip all extensions
echo "${undefined:-default}"
echo "${#path}"
