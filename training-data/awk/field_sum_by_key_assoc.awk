BEGIN { n = split("a 1 b 2 a 3 b 4 c 5", t, " ")
        for (i = 1; i < n; i += 2) sum[t[i]] += t[i+1]
        for (k in sum) print k, sum[k] | "sort" }
