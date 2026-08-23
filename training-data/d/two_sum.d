import std.stdio;

void main() {
    int[] nums = [2, 7, 11, 15];
    int target = 9;
    int[int] seen;
    foreach (i, n; nums) {
        int complement = target - n;
        if (complement in seen) {
            writeln(seen[complement], " ", i);
            return;
        }
        seen[n] = cast(int) i;
    }
}
