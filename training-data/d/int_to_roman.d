// Integer (1..3999) to Roman numeral using a greedy table.
import std.array : appender;
import std.stdio;

immutable int[] values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
immutable string[] symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

string toRoman(int n) {
    auto sb = appender!string;
    foreach (i, v; values)
        while (n >= v) {
            sb ~= symbols[i];
            n -= v;
        }
    return sb[];
}

void main() {
    writeln(toRoman(1994), " ", toRoman(58));
}
