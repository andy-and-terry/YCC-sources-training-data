#!/usr/bin/awk -f
# Parses simple INI-style text into "section.key = value" lines.
/^\[.*\]$/ {
    section = substr($0, 2, length($0) - 2)
    next
}
/=/ {
    split($0, kv, "=")
    gsub(/^[ \t]+|[ \t]+$/, "", kv[1])
    gsub(/^[ \t]+|[ \t]+$/, "", kv[2])
    print section "." kv[1] " = " kv[2]
}
