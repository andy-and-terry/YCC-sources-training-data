import std.stdio;

string columnTitle(int n) {
    string title;
    while (n > 0) {
        n--;
        title = cast(char)('A' + n % 26) ~ title;
        n /= 26;
    }
    return title;
}

void main() {
    writeln(columnTitle(28), " ", columnTitle(701)); // AB ZY
}
