BEGIN {
    split("1 2", a); split("-2 -1", b); split("-1 2", c); split("0 2", d)
    for (i in a) for (j in b) sums[a[i] + b[j]]++
    for (i in c) for (j in d) {
        key = -(c[i] + d[j])
        if (key in sums) count += sums[key]
    }
    print count + 0   # 2
}
