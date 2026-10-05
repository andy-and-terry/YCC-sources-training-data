#!/usr/bin/awk -f
# Count log lines per level and show the first message seen for each.
$3 ~ /^(INFO|WARN|ERROR)$/ {
    count[$3]++
    if (!($3 in first)) {
        msg = $4
        for (i = 5; i <= NF; i++) msg = msg " " $i
        first[$3] = msg
    }
}
END {
    for (lvl in count)
        printf "%-5s %3d  first: %s\n", lvl, count[lvl], first[lvl] | "sort"
}
