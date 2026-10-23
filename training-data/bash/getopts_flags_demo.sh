#!/usr/bin/env bash
set -euo pipefail

verbose=0
name="world"
while getopts ":vn:" opt; do
    case $opt in
        v) verbose=1 ;;
        n) name=$OPTARG ;;
        \?) echo "unknown option: -$OPTARG" ;;
        :) echo "missing argument for -$OPTARG" ;;
    esac
done
shift $((OPTIND - 1))

echo "hello $name verbose=$verbose rest=$*"
