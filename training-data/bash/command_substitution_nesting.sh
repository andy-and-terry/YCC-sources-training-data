#!/usr/bin/env bash
# Nested command substitution is cleaner with $() than backticks.
echo "parent: $(basename "$(dirname "$(pwd)")")"
echo "len of user: $(echo -n "$(whoami)" | wc -c)"
