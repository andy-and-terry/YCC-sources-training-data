#!/usr/bin/env bash
verbose=0; name="world"
while getopts "vn:" opt; do
  case $opt in
    v) verbose=1 ;;
    n) name=$OPTARG ;;
    *) echo "usage: $0 [-v] [-n name]" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))
(( verbose )) && echo "verbose on"
echo "hello $name ${*:+extra: $*}"
