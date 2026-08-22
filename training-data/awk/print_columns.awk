#!/usr/bin/awk -f
# Prints the first and third whitespace-separated fields.
{
    print $1, $3
}
