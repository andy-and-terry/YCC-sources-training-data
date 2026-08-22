#!/usr/bin/awk -f
# Prints the last field of each line, whatever its position.
{
    print $NF
}
