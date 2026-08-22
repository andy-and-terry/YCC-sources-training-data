#!/usr/bin/awk -f
{
    sum[$1] += $2
    count[$1]++
}
END {
    for (key in sum) {
        printf "%s: %.2f\n", key, sum[key] / count[key]
    }
}
