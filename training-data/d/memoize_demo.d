import std.stdio;
import std.functional : memoize;

ulong slowFib(ulong n) {
    return n < 2 ? n : memoize!slowFib(n - 1) + memoize!slowFib(n - 2);
}

void main() {
    writeln(slowFib(50));
    writeln(slowFib(80));
}
