// Perrin sequence P(n)=P(n-2)+P(n-3)
import std.stdio;

void main() {
    long[10] v = [3, 0, 2, 0, 0, 0, 0, 0, 0, 0];
    foreach (i; 3 .. 10) v[i] = v[i - 2] + v[i - 3];
    writeln(v);
}
