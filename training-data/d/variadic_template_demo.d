import std.stdio;
import std.conv : to;

int sumAll(T...)(T values) {
    int total = 0;
    static foreach (v; values) {
        total += v;
    }
    return total;
}

string joinAll(T...)(T values) {
    string result;
    static foreach (i, v; values) {
        static if (i > 0) result ~= ", ";
        result ~= to!string(v);
    }
    return result;
}

void main() {
    writeln(sumAll(1, 2, 3, 4, 5));
    writeln(joinAll(1, "two", 3.0, true));
}
