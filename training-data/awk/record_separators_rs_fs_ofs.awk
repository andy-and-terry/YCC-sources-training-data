#!/usr/bin/awk -f
BEGIN {
    RS = ";"; FS = ":"; OFS = "|"
    data = "a:1;b:2;c:3"
    n = split(data, recs, RS)
    for (i = 1; i <= n; i++) { split(recs[i], f, FS); $0 = f[1] OFS f[2]; print $1, $2 }
    $0 = "x y z"; $2 = "Y"; print; print NF
    $5 = "new"; print; print NF
    $0 = "  lead and trail  "; print NF, $1, $NF
    NF = 2; print
    FS = "[,;]"; $0 = "p,q;r"; print $1 $2 $3, NF
    FS = ""; $0 = "abc"; print NF, $2
    CONVFMT = "%.2g"; a = 3.14159; b = a ""; print b
    ORS = "!\n"; print "bang"
}
