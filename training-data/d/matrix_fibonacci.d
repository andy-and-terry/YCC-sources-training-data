import std.stdio;

alias Mat = ulong[2][2];

Mat multiply(Mat a, Mat b) {
    Mat r;
    foreach (i; 0 .. 2)
        foreach (j; 0 .. 2) {
            r[i][j] = 0;
            foreach (k; 0 .. 2)
                r[i][j] += a[i][k] * b[k][j];
        }
    return r;
}

ulong fib(uint n) {
    Mat result = [[1, 0], [0, 1]];
    Mat base = [[1, 1], [1, 0]];
    while (n > 0) {
        if (n & 1) result = multiply(result, base);
        base = multiply(base, base);
        n >>= 1;
    }
    return result[0][1];
}

void main() {
    foreach (n; [1, 10, 50, 90])
        writefln("fib(%d) = %d", n, fib(n));
}
