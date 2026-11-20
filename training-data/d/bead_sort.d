import std.stdio, std.algorithm, std.range, std.array;
// Bead (gravity) sort.
int[] beadSort(int[] nums) {
    auto cols = iota(0, nums.maxElement).map!(i => cast(int) nums.count!(n => n > i)).array;
    return iota(0, cast(int) nums.length).map!(r => cast(int) cols.count!(c => c > r)).array.reverse;
}
void main() { writeln(beadSort([5, 3, 1, 4, 2])); }
