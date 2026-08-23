import std.stdio;

void main() {
    int[2][2] a = [[1, 2], [3, 4]];
    int[2][2] b = [[5, 6], [7, 8]];
    int[2][2] c;
    foreach (i; 0 .. 2) {
        foreach (j; 0 .. 2) {
            foreach (k; 0 .. 2) {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    writeln(c);
}
