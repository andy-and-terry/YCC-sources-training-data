import std.stdio;
import std.algorithm : nextPermutation, prevPermutation;

void main() {
    int[] a = [1, 2, 3];
    do {
        writeln(a);
    } while (nextPermutation(a));

    writeln(a);  // wrapped back to sorted order

    int[] b = [3, 2, 1];
    prevPermutation(b);
    writeln(b);
}
