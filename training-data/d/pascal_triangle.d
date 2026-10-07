import std.stdio;

long[][] pascal(int rows) {
    long[][] tri;
    foreach (i; 0 .. rows) {
        auto row = new long[](i + 1);
        row[0] = row[i] = 1;
        foreach (j; 1 .. i)
            row[j] = tri[i - 1][j - 1] + tri[i - 1][j];
        tri ~= row;
    }
    return tri;
}

void main() {
    foreach (row; pascal(6))
        writeln(row);
}
