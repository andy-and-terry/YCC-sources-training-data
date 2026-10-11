import std.stdio;
import std.range : assumeSorted;
import std.algorithm : sort;

void main() {
    auto a = [9, 2, 7, 4, 4, 1];
    sort(a);
    auto s = a.assumeSorted;
    writeln(s.contains(7));
    writeln(s.lowerBound(4));
    writeln(s.upperBound(4));
    writeln(s.equalRange(4));
}
