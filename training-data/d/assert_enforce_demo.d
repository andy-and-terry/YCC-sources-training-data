import std.stdio;
import std.exception : enforce, assertThrown, collectException;

int safeDiv(int a, int b) {
    enforce(b != 0, "division by zero");
    return a / b;
}

void main() {
    writeln(safeDiv(10, 2));
    auto e = collectException(safeDiv(1, 0));
    writeln(e.msg);
    assertThrown(safeDiv(1, 0));
    writeln("assertThrown passed");
}
