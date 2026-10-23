#!/usr/bin/gawk -f
# gawk FIELDWIDTHS: parse fixed-width columns with no separators
BEGIN {
    FIELDWIDTHS = "6 10 5"
    print "ID     NAME       QTY"
}
{
    id = $1; name = $2; qty = $3
    gsub(/ +$/, "", name)          # trim padding
    printf "%-6s %-10s %5d\n", id, name, qty + 0
    total += qty
}
END { print "total qty:", total }
# try: printf '001   Widget    %5d\n002   Gadget    %5d\n' 12 30 | gawk -f fieldwidths_fixed_columns.awk
