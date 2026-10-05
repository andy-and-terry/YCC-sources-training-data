import std.stdio;
import std.bigint;

BigInt factorial(uint n) {
    BigInt result = 1;
    foreach (i; 2 .. n + 1)
        result *= i;
    return result;
}

BigInt fibonacci(uint n) {
    BigInt a = 0, b = 1;
    foreach (_; 0 .. n) {
        auto next = a + b;
        a = b;
        b = next;
    }
    return a;
}

void main() {
    writeln("20! = ", factorial(20));
    writeln("30! = ", factorial(30));
    writeln("fib(100) = ", fibonacci(100));
    writeln("2^100 = ", BigInt(2) ^^ 100);
}
