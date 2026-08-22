#!/usr/bin/awk -f
# Prints each distinct input line exactly once, preserving order.
!seen[$0]++
