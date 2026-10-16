#!/usr/bin/awk -f
# Remove trailing # comments and skip blank results
{
    sub(/[ \t]*#.*$/, "")
    if ($0 ~ /^[ \t]*$/) next
    print
}
