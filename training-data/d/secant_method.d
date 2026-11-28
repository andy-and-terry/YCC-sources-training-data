import std.stdio;
import std.math : abs;

double secant(double function(double) f, double x0, double x1) {
    foreach (_; 0 .. 50) {
        double f0 = f(x0), f1 = f(x1);
        if (f1 == f0) break;
        double next = x1 - f1 * (x1 - x0) / (f1 - f0);
        x0 = x1;
        x1 = next;
        if (abs(x1 - x0) < 1e-12) break;
    }
    return x1;
}

void main() {
    writefln("%.10f", secant((double x) => x * x - 2, 1, 2));
}
