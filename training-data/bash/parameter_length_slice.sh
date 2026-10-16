#!/usr/bin/env bash
# Substring slicing, including negative offsets.
s="abcdefghij"
echo "${s:2}"
echo "${s:2:3}"
echo "${s: -3}"
echo "${s: -5:2}"
echo "length ${#s}"
