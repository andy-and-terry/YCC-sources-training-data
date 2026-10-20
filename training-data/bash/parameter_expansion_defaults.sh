#!/usr/bin/env bash
set -euo pipefail

unset name || true
echo "${name:-anonymous}"
echo "${name:=assigned} $name"
path="/usr/local/lib/libfoo.so.1.2"
echo "${path##*/} ${path%/*} ${path%%.*} ${path#*/}"
s="hello world"
echo "${s^^} ${s^} ${s//o/0} ${s/o/0} ${#s} ${s:6} ${s:0:5}"
echo "${undefined_var-unset} ${s:+has value}"
