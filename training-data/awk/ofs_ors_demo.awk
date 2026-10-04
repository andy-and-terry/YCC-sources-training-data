#!/usr/bin/awk -f
# Convert whitespace separated input to a pipe-delimited, semicolon-terminated format.
BEGIN {
    OFS = "|"
    ORS = ";\n"
}
{
    $1 = $1          # force the record to be rebuilt with the new OFS
    print
}
