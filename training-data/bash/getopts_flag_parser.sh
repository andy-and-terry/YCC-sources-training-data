#!/usr/bin/env bash
verbose=0 out=""
while getopts "vo:" opt; do
  case $opt in
    v) verbose=1 ;;
    o) out=$OPTARG ;;
    *) echo "usage: $0 [-v] [-o file]" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))
echo "verbose=$verbose out=$out rest=$*"
