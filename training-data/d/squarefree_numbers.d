// Squarefree numbers up to 100; expect 61.
import std.stdio;

bool squarefree(int n) {
    for (int d = 2; d * d <= n; d++)
        if (n % (d * d) == 0) return false;
    return true;
}

void main() {
    int c = 0;
    foreach (n; 1 .. 101) if (squarefree(n)) c++;
    writeln(c);
}
