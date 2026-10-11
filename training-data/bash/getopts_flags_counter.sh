#!/usr/bin/env bash
# Count repeated -v flags and collect values from -n.
verbosity=0 names=()
while getopts "vn:" opt; do
    case $opt in
        v) (( verbosity++ )) ;;
        n) names+=("$OPTARG") ;;
        *) exit 2 ;;
    esac
done
shift $((OPTIND - 1))
echo "verbosity=$verbosity names=${names[*]} rest=$*"
