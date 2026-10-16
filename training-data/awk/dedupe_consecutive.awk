#!/usr/bin/awk -f
# Like uniq: drop consecutive duplicate lines
$0 != prev { print; prev = $0 }
