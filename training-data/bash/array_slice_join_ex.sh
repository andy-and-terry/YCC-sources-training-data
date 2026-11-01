#!/usr/bin/env bash
arr=(one two three four five)
echo "${arr[@]:1:3}"
echo "${arr[-1]}"
IFS=,; echo "${arr[*]}"; unset IFS
arr+=(six)
echo "${#arr[@]}"
