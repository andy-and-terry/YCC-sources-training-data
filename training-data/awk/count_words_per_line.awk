#!/usr/bin/awk -f
# Prints the word count for each individual line.
{
    print NR ": " NF
}
