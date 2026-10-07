import std.stdio;
import std.algorithm;
import std.array;
import std.range;

void main() {
    auto nums = iota(1, 11);

    auto result = nums
        .filter!(n => n % 2 == 1)
        .map!(n => n * n)
        .array;
    writeln(result);

    writeln(nums.sum);
    writeln(nums.fold!((a, b) => a * b)(1L));
    writeln(nums.maxElement, " ", nums.minElement);

    auto words = ["pear", "fig", "banana", "kiwi"];
    writeln(words.sort!((a, b) => a.length < b.length).array);
    writeln(words.map!(w => w.length).array);
    writeln(nums.chunks(4).map!(c => c.array).array);
}
