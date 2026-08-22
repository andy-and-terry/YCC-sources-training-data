#!/usr/bin/awk -f
# Replaces the second field with "REDACTED" and reprints the line.
{
    $2 = "REDACTED"
    print
}
