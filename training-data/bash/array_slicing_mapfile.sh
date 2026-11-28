#!/usr/bin/env bash
mapfile -t lines < <(printf '%s\n' one two three four)
echo "${#lines[@]}"
echo "${lines[@]:1:2}"
echo "${lines[-1]}"
