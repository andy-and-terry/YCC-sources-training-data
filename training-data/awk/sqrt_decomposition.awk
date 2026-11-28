BEGIN {
    n = split("5 3 8 1 9 2 7 4 6 0 3 5", a, " ")
    bs = int(sqrt(n)); if (bs * bs < n) bs++
    for (i = 1; i <= n; i++) blk[int((i - 1) / bs)] += a[i]
    l = 3; r = 10; sum = 0
    for (i = l; i <= r; i++) {
        if ((i - 1) % bs == 0 && i + bs - 1 <= r) { sum += blk[int((i - 1) / bs)]; i += bs - 1 }
        else sum += a[i]
    }
    print "sum[" l ".." r "] =", sum
}
