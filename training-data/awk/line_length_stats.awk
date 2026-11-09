{
    len = length($0)
    if (NR == 1 || len > max) max = len
    if (NR == 1 || len < min) min = len
    total += len
}
END {
    printf "min=%d max=%d avg=%.2f\n", min, max, total / NR
}
