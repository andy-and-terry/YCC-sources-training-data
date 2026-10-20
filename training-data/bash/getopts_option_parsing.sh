#!/usr/bin/env bash
set -euo pipefail

verbose=0 out=""
while getopts ":vo:h" opt; do
  case $opt in
    v) verbose=$((verbose + 1)) ;;
    o) out=$OPTARG ;;
    h) echo "usage: $0 [-v] [-o file] args"; exit 0 ;;
    \?) echo "bad option -$OPTARG" >&2; exit 2 ;;
    :) echo "-$OPTARG needs arg" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))
echo "verbose=$verbose out=${out:-none} rest=$*"
