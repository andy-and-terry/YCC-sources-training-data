{
    for (i = 1; i <= NF; i++) count[tolower($i)]++
}
END {
    for (w in count) printf "%d %s\n", count[w], w | "sort -rn"
}
