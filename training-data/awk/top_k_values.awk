# Print the k largest numbers from input using a simple insertion into a top list
BEGIN { k = 3 }
{
    for (i = 1; i <= NF; i++) {
        v = $i + 0
        if (n < k) top[++n] = v
        else {
            min_i = 1
            for (j = 2; j <= k; j++) if (top[j] < top[min_i]) min_i = j
            if (v > top[min_i]) top[min_i] = v
            else continue
        }
    }
}
END {
    for (i = 1; i <= n; i++)
        for (j = i + 1; j <= n; j++)
            if (top[j] > top[i]) { t = top[i]; top[i] = top[j]; top[j] = t }
    for (i = 1; i <= n; i++) print top[i]
}
