#!/usr/bin/awk -f
# Changing OFS and ORS; assigning to $1 rebuilds the record using OFS.
BEGIN { OFS = "-"; ORS = " | " }
{
    $1 = $1
    print
}
END { printf "\n" }
