import std.stdio;
import std.array : appender;

string zigzag(string s, int rows) {
    if (rows == 1 || rows >= s.length) return s;
    auto lines = new string[rows];
    int r = 0, step = 1;
    foreach (c; s) {
        lines[r] ~= c;
        if (r == 0) step = 1;
        else if (r == rows - 1) step = -1;
        r += step;
    }
    string result;
    foreach (l; lines) result ~= l;
    return result;
}

void main() {
    writeln(zigzag("PAYPALISHIRING", 3));
}
