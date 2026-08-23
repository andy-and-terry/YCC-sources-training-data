import std.stdio;

string intToRoman(int num) {
    int[] values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[] symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    int n = num;
    string result = "";
    foreach (i, value; values) {
        while (n >= value) {
            result ~= symbols[i];
            n -= value;
        }
    }
    return result;
}

void main() {
    writeln(intToRoman(1994));
}
