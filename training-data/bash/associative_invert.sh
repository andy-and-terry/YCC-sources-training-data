#!/usr/bin/env bash
# Invert an associative array (values become keys).
declare -A color=([apple]=red [banana]=yellow [cherry]=red)
declare -A inv
for k in "${!color[@]}"; do
    v=${color[$k]}
    inv[$v]+="${inv[$v]:+,}$k"
done
for v in "${!inv[@]}"; do echo "$v -> ${inv[$v]}"; done | sort
