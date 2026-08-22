#!/usr/bin/awk -f
# Removes lines starting with '#' and blank lines.
!/^#/ && NF > 0
