#!/usr/bin/env bash
# Split a path with pure parameter expansion and compare to coreutils.
p=/var/log/nginx/access.log
echo "dir : ${p%/*}  (dirname: $(dirname "$p"))"
echo "file: ${p##*/}  (basename: $(basename "$p"))"
file=${p##*/}
echo "stem: ${file%.*}  ext: ${file##*.}"
