import std.stdio;
import std.numeric;
import std.math : isClose;

void main() {
    // Greatest common divisor
    writeln(gcd(48, 18));
    writeln(gcd(17, 5));

    // Dot product of two ranges
    double[] a = [1.0, 2.0, 3.0];
    double[] b = [4.0, 5.0, 6.0];
    writeln(dotProduct(a, b));

    // Euclidean-style norm built from dotProduct
    import std.math : sqrt;
    writeln(sqrt(dotProduct(a, a)));

    // Cosine similarity
    auto cos = dotProduct(a, b) / (sqrt(dotProduct(a, a)) * sqrt(dotProduct(b, b)));
    writefln("%.4f", cos);

    // findRoot bracketing a zero of a function
    auto root = findRoot((double x) => x * x - 2.0, 0.0, 2.0);
    writefln("sqrt(2) ~ %.6f", root);

    // Approximate comparison of floating point numbers
    writeln(isClose(0.1 + 0.2, 0.3));
    writeln(0.1 + 0.2 == 0.3);
}
