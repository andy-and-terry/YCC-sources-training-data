#!/usr/bin/env bash
# Shortest and longest prefix/suffix removal.
path="/usr/local/lib/libfoo.so.1.2"
echo "dirname-ish : ${path%/*}"
echo "basename    : ${path##*/}"
echo "no ext      : ${path%%.*}"
echo "last ext    : ${path##*.}"
echo "strip /usr  : ${path#/usr}"
