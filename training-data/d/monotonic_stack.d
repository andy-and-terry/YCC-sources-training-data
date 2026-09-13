import std.stdio;

int[] nextGreaterElement(int[] nums) {
    auto result = new int[nums.length];
    int[] stack;

    foreach_reverse (i, n; nums) {
        while (stack.length > 0 && stack[$ - 1] <= n) {
            stack = stack[0 .. $ - 1];
        }
        result[i] = stack.length == 0 ? -1 : stack[$ - 1];
        stack ~= n;
    }

    return result;
}

void main() {
    auto nums = [2, 1, 2, 4, 3, 1];
    writeln(nextGreaterElement(nums));
}
