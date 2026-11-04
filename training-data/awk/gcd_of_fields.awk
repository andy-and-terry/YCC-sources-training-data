# Prints the gcd of the numbers on each input line.
function gcd(a, b,    t) {
    a = a < 0 ? -a : a; b = b < 0 ? -b : b
    while (b != 0) { t = a % b; a = b; b = t }
    return a
}

{
    g = 0
    for (i = 1; i <= NF; i++) g = gcd(g, $i)
    print g
}
# try: printf '12 18 24\n7 13\n' | awk -f gcd_of_fields.awk
