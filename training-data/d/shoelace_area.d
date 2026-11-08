import std.stdio;
import std.math : abs;

double area(double[2][] p) {
    double s = 0;
    foreach (i; 0 .. p.length) {
        auto j = (i + 1) % p.length;
        s += p[i][0] * p[j][1] - p[j][0] * p[i][1];
    }
    return abs(s) / 2;
}

void main() { writeln(area([[0, 0], [4, 0], [4, 3], [0, 3]])); }
