import std.stdio;
import std.conv : to;
import std.algorithm : reverse;
import std.array : array;

// Reverse-and-add until a palindrome; count the steps.
ulong reverseDigits(ulong n) {
    char[] s = to!string(n).dup;
    reverse(s);
    return to!ulong(s);
}

int steps(ulong n) {
    foreach (count; 0 .. 50) {
        if (count > 0 && n == reverseDigits(n)) return count;
        n += reverseDigits(n);
    }
    return -1;
}

void main() {
    foreach (n; [56UL, 57, 59, 79, 89])
        write(steps(n), " ");
    writeln();
}
