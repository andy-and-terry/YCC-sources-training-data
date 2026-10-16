#!/usr/bin/env bash
# Find the largest number from a stream using sort and head.
printf '%s\n' 5 12 7 98 3 41 | sort -n | tail -n 1
printf '%s\n' 5 12 7 98 3 41 | sort -nr | sed -n '2p'
