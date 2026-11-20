import std.stdio, std.algorithm, std.range;
// Aliquot sum classification.
void main() {
    foreach (n; [6, 12, 15, 28]) {
        int a = iota(1, n).filter!(d => n % d == 0).sum;
        writeln(n, " ", a, " ", a == n ? "perfect" : a > n ? "abundant" : "deficient");
    }
}
