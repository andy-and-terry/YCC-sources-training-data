import std.stdio, std.functional, std.algorithm, std.range;

int delegate(int) makeAdder(int n) { return (int x) => x + n; }

auto compose(alias f, alias g)() { return (int x) => f(g(x)); }

void main() {
    auto add5 = makeAdder(5);
    writeln(add5(10));
    alias dbl = (int x) => x * 2;
    alias inc = (int x) => x + 1;
    writeln(compose!(dbl, inc)()(4));
    writeln(unaryFun!"a * a"(7), " ", binaryFun!"a + b"(2, 3));
    auto mulBy = (int k) => (int x) => x * k;
    writeln(mulBy(3)(5));
    writeln(partial!((int a, int b) => a - b, 10)(3));
    alias memoFib = memoize!((ulong n) => n < 2 ? n : memoFib(n - 1) + memoFib(n - 2));
    writeln(memoFib(40));
    int count;
    auto counter = () => ++count;
    counter(); counter();
    writeln(count);
    writeln([1, 2, 3].map!(a => a * 10).array, " ", pipe!(map!"a + 1", filter!"a > 2")([1, 2, 3]).array);
    auto adder = curry!((int a, int b, int c) => a + b + c, 1)(2);
    writeln(adder(3));
}
