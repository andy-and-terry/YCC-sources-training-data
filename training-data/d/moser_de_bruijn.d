import std.stdio;
import std.conv : to;

// Moser-de Bruijn sequence: binary digits of n read in base 4.
void main() {
    foreach (n; 0 .. 12)
        write(to!int(to!string(n, 2), 4), " ");
    writeln();
}
