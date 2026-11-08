import std.stdio;
import std.math : abs;

double secant(double function(double) f, double a, double b) {
    foreach (_; 0 .. 40) {
        double fa = f(a), fb = f(b);
        if (abs(fb - fa) < 1e-15) break;
        double c = b - fb * (b - a) / (fb - fa);
        a = b;
        b = c;
    }
    return b;
}

void main() { writefln("%.8f", secant(x => x * x - 2, 1, 2)); }
