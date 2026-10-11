#!/usr/bin/awk -f
# Number only the non-blank lines
NF { printf "%3d  %s\n", ++n, $0; next }
{ print }
