import std.stdio;
import std.array : appender;

string encode(string text, int rails) {
    auto rows = new string[rails];
    int r = 0, step = 1;
    foreach (ch; text) {
        rows[r] ~= ch;
        if (r == 0) step = 1;
        else if (r == rails - 1) step = -1;
        r += step;
    }
    string result;
    foreach (row; rows) result ~= row;
    return result;
}

void main() {
    writeln(encode("WEAREDISCOVERED", 3));
}
