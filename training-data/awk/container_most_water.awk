# echo "1 8 6 2 5 4 8 3 7" | awk -f container_most_water.awk
{
    lo = 1; hi = NF; best = 0
    while (lo < hi) {
        m = ($lo < $hi) ? $lo : $hi
        if (m * (hi - lo) > best) best = m * (hi - lo)
        if ($lo < $hi) lo++; else hi--
    }
    print best
}
