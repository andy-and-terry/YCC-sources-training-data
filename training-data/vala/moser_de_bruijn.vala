// Moser-de Bruijn sequence: binary digits of n read in base 4.
uint moser (uint n) {
    uint result = 0, place = 1;
    for (; n > 0; n >>= 1, place *= 4)
        if ((n & 1) == 1) result += place;
    return result;
}

void main () {
    var sb = new StringBuilder ();
    for (uint n = 0; n < 12; n++) sb.append ("%u ".printf (moser (n)));
    print ("%s\n", sb.str);
}
