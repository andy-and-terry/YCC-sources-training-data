// Narayana's cows N(n)=N(n-1)+N(n-3)
import std.stdio;

void main() {
    long[10] v = [1, 1, 1, 0, 0, 0, 0, 0, 0, 0];
    foreach (i; 3 .. 10) v[i] = v[i - 1] + v[i - 3];
    writeln(v);
}
