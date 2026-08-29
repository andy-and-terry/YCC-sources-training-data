string to_roman(int n) {
    int[] values = { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    string[] symbols = { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
    var result = new StringBuilder();
    int remaining = n;
    for (int i = 0; i < values.length; i++) {
        while (remaining >= values[i]) {
            result.append(symbols[i]);
            remaining -= values[i];
        }
    }
    return result.str;
}

void main() {
    stdout.printf("%s\n", to_roman(1994));
}
