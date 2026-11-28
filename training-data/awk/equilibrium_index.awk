# echo "1 7 3 6 5 6" | awk -f equilibrium_index.awk
{
    total = 0
    for (i = 1; i <= NF; i++) total += $i
    left = 0
    for (i = 1; i <= NF; i++) {
        if (left == total - left - $i) { print "index", i - 1; exit }
        left += $i
    }
    print -1
}
