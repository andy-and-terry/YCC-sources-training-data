#!/usr/bin/awk -f
# Prints each distinct value seen in the first field, in first-seen order.
{
    if (!($1 in seen)) {
        seen[$1] = 1
        print $1
    }
}
