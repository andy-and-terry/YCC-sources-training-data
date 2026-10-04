#!/usr/bin/awk -f
# Modifying a field or NF rebuilds $0; assigning $0 re-splits the fields.
{
    print "original: ", $0
    $2 = "***"                # modify one field: $0 is rebuilt with OFS
    print "masked:   ", $0
    NF = 2                    # truncate the record to two fields
    print "truncated:", $0
    $5 = "new"                # extend: fields 3 and 4 become empty
    print "extended: ", $0, "(NF=" NF ")"
    $0 = "re split these words"
    print "resplit:  ", NF, $3
}
