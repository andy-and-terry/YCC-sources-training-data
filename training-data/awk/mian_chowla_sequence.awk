# Greedy sequence whose pairwise sums are all distinct.
BEGIN {
    n = 0
    for (cand = 1; n < 8; cand++) {
        delete fresh
        ok = 1
        seq[n] = cand
        for (i = 0; i <= n && ok; i++) {
            s = seq[i] + cand
            if ((s in sums) || (s in fresh)) ok = 0
            else fresh[s] = 1
        }
        if (ok) {
            for (s in fresh) sums[s] = 1
            n++
        }
    }
    for (i = 0; i < 8; i++) printf "%d ", seq[i]
    print ""
}
