# Moser-de Bruijn sequence: binary digits of n read in base 4.
function moser(n,   result, place) {
    result = 0; place = 1
    while (n > 0) {
        if (n % 2 == 1) result += place
        n = int(n / 2)
        place *= 4
    }
    return result
}

BEGIN {
    for (i = 0; i < 12; i++) printf "%d ", moser(i)
    printf "\n"
}
