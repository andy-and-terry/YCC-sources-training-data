import std.stdio;

int findMissing(int[] arr, int n) {
    int expectedSum = n * (n + 1) / 2;
    int actualSum = 0;
    foreach (v; arr) actualSum += v;
    return expectedSum - actualSum;
}

void main() {
    writeln(findMissing([1, 2, 4, 5, 6], 6));
}
