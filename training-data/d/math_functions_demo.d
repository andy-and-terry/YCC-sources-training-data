import std.stdio;
import std.math;

void main() {
    writefln("%.4f", sqrt(2.0));
    writefln("%.4f", pow(2.0, 0.5));
    writeln(floor(2.7), " ", ceil(2.1), " ", round(2.5));
    writeln(abs(-4), " ", isNaN(double.nan));
    writeln(approxEqual(0.1 + 0.2, 0.3));
    writefln("%.4f", atan2(1.0, 1.0) * 4);
}
