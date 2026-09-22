import std.stdio;
import std.parallelism;
import std.range;
import std.array;

void main() {
    auto numbers = iota(1, 1_000_001).array;
    long total = 0;

    foreach (n; parallel(numbers)) {
        synchronized {
            total += n;
        }
    }

    writeln(total);
}
