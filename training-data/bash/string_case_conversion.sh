#!/usr/bin/env bash
# Case conversion using parameter expansion (bash 4+).
s="Hello World from Bash"
echo "${s^^}"
echo "${s,,}"
echo "${s^}"
echo "${s,,[AEIOU]}"
word="bash"
echo "${word^}"
