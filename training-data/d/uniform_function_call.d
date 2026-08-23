import std.stdio;

int square(int x) {
    return x * x;
}

void main() {
    int n = 5;
    writeln(n.square());
    writeln(square(n));

    int[] nums = [1, 2, 3, 4];
    writeln(nums.length);
}
