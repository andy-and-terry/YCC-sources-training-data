#!/usr/bin/env bash
path="/usr/local/lib/libfoo.so.1.2"
echo "${path##*/}"
echo "${path%/*}"
echo "${path%%.*}"
echo "${path#*/}"
echo "${path/lib/LIB}"
echo "${path//l/L}"
unset missing
echo "${missing:-default}"
echo "${#path}"
echo "${path^^}"
