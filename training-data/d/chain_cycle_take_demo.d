import std.stdio;
import std.range : chain, cycle, take, only;
import std.array : array;

void main() {
    auto a = [1, 2, 3];
    auto b = [10, 20];
    writeln(chain(a, b));
    writeln(cycle(a).take(8).array);
    writeln(chain(only(0), a, only(99)));
}
