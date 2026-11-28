# One triangle row per line: printf '2\n3 4\n6 5 7\n4 1 8 3\n' | awk -f triangle_min_path.awk
{ for (i = 1; i <= NF; i++) t[NR, i] = $i; width[NR] = NF }
END {
    for (i = 1; i <= width[NR]; i++) dp[i] = t[NR, i]
    for (r = NR - 1; r >= 1; r--)
        for (i = 1; i <= width[r]; i++) {
            m = (dp[i] < dp[i + 1]) ? dp[i] : dp[i + 1]
            dp[i] = t[r, i] + m
        }
    print dp[1]
}
