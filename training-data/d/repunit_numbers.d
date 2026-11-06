// Repunits: numbers made only of the digit 1.
import std.stdio;

void main() {
    long r = 0;
    foreach (i; 0 .. 5) {
        r = r * 10 + 1;
        write(r, " ");
    }
    writeln();
}
