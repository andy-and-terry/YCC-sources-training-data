import std.stdio;

ulong fib(uint n) { return n < 2 ? n : fib(n - 1) + fib(n - 2); }

enum ulong f20 = fib(20);
static assert(f20 == 6765);

void main() { writeln(f20); }
