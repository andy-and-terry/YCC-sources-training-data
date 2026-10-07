#!/usr/bin/awk -f
# Deduplicates rows by a composite key made of fields 1 and 2 (not the whole line).
{
    key = $1 SUBSEP $2
    if (!(key in seen)) {
        seen[key] = 1
        print
    }
}
