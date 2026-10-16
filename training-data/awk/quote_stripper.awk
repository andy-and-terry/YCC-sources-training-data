#!/usr/bin/awk -f
# Remove surrounding double quotes from every field
BEGIN { FS = OFS = "," }
{
    for (i = 1; i <= NF; i++) gsub(/^"|"$/, "", $i)
    print
}
