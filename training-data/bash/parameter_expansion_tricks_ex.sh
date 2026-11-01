#!/usr/bin/env bash
path=/usr/local/lib/libfoo.so.1.2
echo "${path##*/}"
echo "${path%.*}"
echo "${path%%.*}"
echo "${path/local/opt}"
v=
echo "${v:-default} ${#path} ${path^^}"
