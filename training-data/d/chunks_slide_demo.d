import std.stdio;
import std.range;
import std.algorithm;

void main()
{
    auto data = iota(1, 11);

    // Fixed-size, non-overlapping groups.
    foreach (c; data.chunks(4))
        writeln(c);

    // Overlapping windows.
    auto sums = data.slide(3).map!(w => w.sum);
    writeln(sums);

    // Combine with stride and zip.
    writeln(data.stride(3));
    writeln(zip(data, data.drop(1)).map!(p => p[1] - p[0]).array);
}
