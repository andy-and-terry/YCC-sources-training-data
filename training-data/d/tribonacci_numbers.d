import std.stdio;
import std.range : take;
import std.array : array;

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
struct Tribonacci {
    ulong a = 0, b = 0, c = 1;
    enum empty = false;
    @property ulong front() const { return a; }
    void popFront() {
        immutable next = a + b + c;
        a = b; b = c; c = next;
    }
}

void main() {
    writeln("Tribonacci: ", Tribonacci().take(15).array);
}
