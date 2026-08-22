#!/usr/bin/awk -f
# Prints the number of fields on each line.
{
    print NR": "NF" fields"
}
