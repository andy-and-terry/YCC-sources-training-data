#!/usr/bin/env bash
arr=(a b c d e f)
echo "${arr[@]:2:3}"
IFS=,; echo "${arr[*]}"
