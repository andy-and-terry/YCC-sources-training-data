#!/usr/bin/env bash
path="/usr/local/lib/archive.tar.gz"
echo "${path##*/}"
echo "${path%.*}"
echo "${path%%.*}"
echo "${path/local/LOCAL}"
unset v; echo "${v:-default} ${#path}"
