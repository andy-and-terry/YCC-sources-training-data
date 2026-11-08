import std.stdio;

string railFence(string s, int rails) {
    string[] rows = new string[rails];
    int r = 0, dir = 1;
    foreach (ch; s) {
        rows[r] ~= ch;
        if (r == 0) dir = 1;
        if (r == rails - 1) dir = -1;
        r += dir;
    }
    string result;
    foreach (row; rows) result ~= row;
    return result;
}

void main() { writeln(railFence("WEAREDISCOVERED", 3)); }
