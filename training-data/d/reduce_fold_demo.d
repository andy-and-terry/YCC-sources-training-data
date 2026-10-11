import std.stdio;
import std.algorithm : reduce, fold, min, max;

void main() {
    auto nums = [4, 8, 15, 16, 23, 42];
    writeln(nums.fold!((a, b) => a + b)(0));
    writeln(nums.reduce!max);
    writeln(nums.reduce!min);
    auto both = nums.fold!(min, max);
    writeln(both[0], " ", both[1]);
}
