import std.stdio;

enum fib(int n) = n < 2 ? n : fib!(n - 1) + fib!(n - 2);

void main() {
    static assert(fib!10 == 55);
    writeln(fib!15);
}
