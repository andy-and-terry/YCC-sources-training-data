import std.stdio;

bool isToeplitz(int[][] m) {
    foreach (i; 1 .. m.length)
        foreach (j; 1 .. m[i].length)
            if (m[i][j] != m[i - 1][j - 1]) return false;
    return true;
}

void main() {
    writeln(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]));
    writeln(isToeplitz([[1, 2], [2, 2]]));
}
