// Integer (1..3999) to Roman numeral using a greedy table.
const int[] VALUES = { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
const string[] SYMBOLS = { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };

string to_roman (int n) {
    var sb = new StringBuilder ();
    for (int i = 0; i < VALUES.length; i++) {
        while (n >= VALUES[i]) {
            sb.append (SYMBOLS[i]);
            n -= VALUES[i];
        }
    }
    return sb.str;
}

void main () {
    print ("%s %s\n", to_roman (1994), to_roman (58));
}
