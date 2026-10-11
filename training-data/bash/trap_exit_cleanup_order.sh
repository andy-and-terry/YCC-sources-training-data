#!/usr/bin/env bash
# EXIT trap runs after the script body, even on exit from a function.
trap 'echo "cleanup 1"' EXIT
finish() { echo "finishing"; exit 3; }
echo "start"
finish
echo "never reached"
