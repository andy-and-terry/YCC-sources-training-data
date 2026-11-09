#!/usr/bin/env bash
arr=(a b c d e f)
echo "${arr[@]:1:3}"
echo "${#arr[@]}"
arr+=(g)
echo "${arr[-1]}"
unset 'arr[0]'
echo "${arr[@]}"
