#!/usr/bin/awk -f
# Assigning to a field forces $0 to be rebuilt using OFS
BEGIN { FS = ","; OFS = ";" }
{
    $1 = $1
    print
}
