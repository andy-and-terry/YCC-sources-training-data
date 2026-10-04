import std.stdio;
import std.algorithm;
import std.array;
import std.range;

void main() {
    auto numbers = iota(1, 21);

    auto result = numbers
        .filter!(n => n % 3 == 0)
        .map!(n => n * n)
        .array;
    writeln(result);

    writeln(numbers.sum);
    writeln(numbers.fold!((a, b) => a * b)(1L) > 0);
    writeln(numbers.take(5).retro);
    writeln(numbers.chunks(7).map!(c => c.sum));
    writeln(zip(numbers.take(3), "abc").array);
    writeln(["pear", "fig", "apple"].sort!((a, b) => a.length < b.length));
    writeln(numbers.until!(n => n > 4));
    writeln(numbers.countUntil(10));
    writeln(only(1, 2).chain(only(3)).array);
}
