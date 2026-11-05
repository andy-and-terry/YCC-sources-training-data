#!/usr/bin/env bash
arr=(a b c d e)
arr+=(f)
echo "${arr[@]:1:3}"
echo "${#arr[@]}"
echo "${arr[-1]}"
