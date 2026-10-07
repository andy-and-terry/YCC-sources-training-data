#!/usr/bin/awk -f
# Capitalize the first letter of each field using substr/toupper/tolower.
{
    for (i = 1; i <= NF; i++)
        $i = toupper(substr($i, 1, 1)) tolower(substr($i, 2))
    print
}
