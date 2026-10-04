import std.stdio;
import std.exception;

int safeSqrtFloor(int n) {
    enforce(n >= 0, "negative input");
    int r = 0;
    while ((r + 1) * (r + 1) <= n) r++;
    return r;
}

void main() {
    writeln(safeSqrtFloor(17));

    try {
        safeSqrtFloor(-4);
    } catch (Exception e) {
        writeln("enforce failed: ", e.msg);
    }

    auto result = collectException(safeSqrtFloor(-1));
    writeln(result !is null);

    assertThrown(safeSqrtFloor(-9));
    assertNotThrown(safeSqrtFloor(9));

    int x = 5;
    assert(x > 0, "x must be positive");
    writeln("assertions passed");
}
