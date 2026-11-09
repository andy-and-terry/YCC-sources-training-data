#!/usr/bin/env bash
echo "today is $(date +%A), dir has $(ls | wc -l) entries"
latest=$(ls -t | head -n1)
echo "newest: ${latest:-none}"
