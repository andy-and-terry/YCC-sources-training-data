import std.stdio;

void permute(int[] nums, ref int[] current, ref bool[] used, ref int[][] result) {
    if (current.length == nums.length) {
        result ~= current.dup;
        return;
    }

    foreach (i, num; nums) {
        if (used[i]) continue;
        used[i] = true;
        current ~= num;
        permute(nums, current, used, result);
        current = current[0 .. $ - 1];
        used[i] = false;
    }
}

void main() {
    int[] nums = [1, 2, 3];
    int[] current;
    auto used = new bool[nums.length];
    int[][] result;
    permute(nums, current, used, result);
    writeln(result);
}
