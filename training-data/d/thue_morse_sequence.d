import core.bitop : popcnt;
import std.stdio;

// Thue-Morse: t(n) is the parity of the number of 1 bits in n
void main() {
    foreach (n; 0 .. 32) write(popcnt(n) % 2);
    writeln();
}
