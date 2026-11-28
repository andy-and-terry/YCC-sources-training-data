import std.stdio;
import std.complex;

void main() {
    foreach (yi; -5 .. 6) {
        foreach (xi; -40 .. 13) {
            auto c = complex(xi / 20.0, yi / 5.0);
            auto z = complex(0.0, 0.0);
            int n = 0;
            while (n < 30 && sqAbs(z) < 4) { z = z * z + c; n++; }
            write(n == 30 ? '#' : '.');
        }
        writeln();
    }
}
