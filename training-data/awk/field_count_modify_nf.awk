#!/usr/bin/awk -f
# Assigning to a field rebuilds $0 using OFS; $NF is the last field and
# $(NF-1) the one before it. Decrementing NF drops trailing fields.
BEGIN { OFS = "," }
{
    last = $NF
    prev = $(NF - 1)
    printf "line %d: NF=%d last=%s prev=%s\n", NR, NF, last, prev

    $2 = toupper($2)       # forces $0 to be rebuilt with OFS
    print

    NF = NF - 1            # drop the last field
    print
}
