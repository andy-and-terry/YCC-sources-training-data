// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
import std.stdio;

void main() {
    long a = 0, b = 1;
    foreach (i; 0 .. 15) {
        write(a, i < 14 ? " " : "\n");
        immutable next = b + 2 * a;
        a = b;
        b = next;
    }
}
