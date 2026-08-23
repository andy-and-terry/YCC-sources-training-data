import std.stdio;
import std.algorithm : reduce, min, max;

void main() {
    int[] data = [5, 3, 8, 1, 9, 2];
    int sum = 0;
    foreach (v; data) sum += v;
    writeln("sum: ", sum);
    writeln("min: ", reduce!min(data));
    writeln("max: ", reduce!max(data));
    writeln("avg: ", cast(double) sum / data.length);
}
