#!/usr/bin/awk -f
{
    if ($1 ~ /^[0-9]+(\.[0-9]+)?$/) {
        print $1, "is numeric"
    } else {
        print $1, "is not numeric"
    }
}
