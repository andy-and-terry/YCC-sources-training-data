import std.stdio;
import std.typecons;

Tuple!(int, "quotient", int, "remainder") divmod(int a, int b) {
    return tuple!("quotient", "remainder")(a / b, a % b);
}

Nullable!int findFirstEven(int[] values) {
    foreach (v; values) {
        if (v % 2 == 0) return Nullable!int(v);
    }
    return Nullable!int.init;
}

void main() {
    auto result = divmod(17, 5);
    writeln(result.quotient, " ", result.remainder);

    auto found = findFirstEven([1, 3, 5, 8, 9]);
    if (!found.isNull) {
        writeln("first even: ", found.get);
    }

    auto notFound = findFirstEven([1, 3, 5]);
    writeln(notFound.isNull);
}
