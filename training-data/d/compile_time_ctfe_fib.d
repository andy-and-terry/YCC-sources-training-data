import std.stdio;

ulong fib(uint n) { return n < 2 ? n : fib(n - 1) + fib(n - 2); }
enum f20 = fib(20);

void main() { writeln(f20); }
