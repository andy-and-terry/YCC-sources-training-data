#!/usr/bin/env bash
# Parse -v (flag), -n NAME (option with value), then positional leftovers.
verbose=0
name="world"

while getopts ":vn:" opt; do
  case $opt in
    v) verbose=1 ;;
    n) name=$OPTARG ;;
    :) echo "option -$OPTARG needs an argument" >&2; exit 2 ;;
    \?) echo "unknown option -$OPTARG" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))

(( verbose )) && echo "verbose on"
echo "hello $name, extras: $*"
