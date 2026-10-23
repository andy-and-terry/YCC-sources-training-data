import std.stdio;
import std.algorithm : cumulativeFold, equal;
import std.array : array;

void main() {
    int[] data = [1, 2, 3, 4, 5];

    auto running = data.cumulativeFold!((a, b) => a + b);
    writeln(running);

    auto runningMax = [3, 1, 4, 1, 5, 9, 2].cumulativeFold!((a, b) => a > b ? a : b);
    writeln(runningMax);

    assert(equal(running, [1, 3, 6, 10, 15]));
}
