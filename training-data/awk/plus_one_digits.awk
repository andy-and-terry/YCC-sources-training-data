# echo "1 2 9" | awk -f plus_one_digits.awk
{
    for (i = NF; i >= 1; i--) {
        if ($i < 9) { $i++; print; exit }
        $i = 0
    }
    if (i < 1) print "1 " $0
}
