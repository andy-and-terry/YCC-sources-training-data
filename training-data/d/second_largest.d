import std.stdio;
import std.algorithm : sort, uniq;
import std.array : array;

int secondLargest(int[] arr) {
    auto sorted = arr.dup.sort!("a > b").array;
    auto distinct = sorted.uniq.array;
    return distinct[1];
}

void main() {
    writeln(secondLargest([5, 3, 8, 1, 9, 2]));
}
