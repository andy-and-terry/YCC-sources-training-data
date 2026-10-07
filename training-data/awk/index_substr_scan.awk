#!/usr/bin/awk -f
# Find every occurrence of a literal substring using index() and substr().
# Usage: awk -v pat=ab -f index_substr_scan.awk file
BEGIN {
    if (pat == "") pat = "ab"
}
{
    rest = $0
    offset = 0
    hits = ""
    while ((pos = index(rest, pat)) > 0) {
        hits = hits (hits == "" ? "" : ",") (offset + pos)
        offset += pos + length(pat) - 1
        rest = substr(rest, pos + length(pat))
    }
    if (hits != "") print NR ": '" pat "' at columns " hits
}
