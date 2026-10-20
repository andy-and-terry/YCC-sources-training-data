#!/usr/bin/env bash
set -euo pipefail

data=$'alice,30,eng\nbob,25,ops\ncarol,41,eng'
echo "$data" | awk -F, '$3=="eng"{s+=$2;n++} END{print s/n}'
echo "$data" | sed -n '2,3p'
echo "$data" | sed -E 's/^([a-z]+),([0-9]+).*/\U\1\E is \2/'
echo "$data" | cut -d, -f1,3 | sort -t, -k2,2 -k1,1r
echo "$data" | awk -F, '{printf "%-6s|%3d\n", $1, $2}'
echo "$data" | tr ',' '\t'
