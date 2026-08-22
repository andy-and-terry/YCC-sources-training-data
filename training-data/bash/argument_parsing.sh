#!/usr/bin/env bash
set -euo pipefail

verbose=0
name="world"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -v|--verbose)
            verbose=1
            shift
            ;;
        -n|--name)
            name="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

if ((verbose)); then
    echo "verbose mode on"
fi
echo "Hello, $name!"
