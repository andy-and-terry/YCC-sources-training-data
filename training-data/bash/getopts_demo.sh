#!/usr/bin/env bash
set -euo pipefail

verbose=0
output="out.txt"

while getopts ":vo:h" opt; do
    case "$opt" in
        v)
            verbose=1
            ;;
        o)
            output="$OPTARG"
            ;;
        h)
            echo "usage: $0 [-v] [-o file] [-h]"
            exit 0
            ;;
        \?)
            echo "unknown option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "option -$OPTARG requires an argument" >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND - 1))

if ((verbose)); then
    echo "verbose mode on"
fi
echo "output file: $output"
echo "remaining args: $*"
