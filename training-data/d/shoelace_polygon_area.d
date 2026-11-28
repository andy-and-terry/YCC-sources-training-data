import std.stdio;
import std.math : abs;

double area(const double[2][] p) {
    double s = 0;
    foreach (i, a; p) {
        auto b = p[(i + 1) % p.length];
        s += a[0] * b[1] - b[0] * a[1];
    }
    return abs(s) / 2;
}

void main() {
    writeln(area([[0.0, 0.0], [4.0, 0.0], [4.0, 3.0], [0.0, 3.0]]));
}
