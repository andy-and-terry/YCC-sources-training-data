#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 [-h] [-o output] input"
    exit 1
}

output="out.txt"
while getopts ":ho:" opt; do
    case $opt in
        h) usage ;;
        o) output="$OPTARG" ;;
        \?) usage ;;
    esac
done
shift $((OPTIND - 1))

if [[ $# -lt 1 ]]; then
    usage
fi

echo "input=$1 output=$output"
