import std.stdio;
import std.algorithm;
import std.array;

void main() {
    auto numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    auto evenSquares = numbers.filter!(x => x % 2 == 0).map!(x => x * x).array;
    writeln(evenSquares);
    auto total = numbers.fold!((a, b) => a + b)(0);
    writeln(total);
}
