import std.stdio;
import std.numeric : gcd;
import std.algorithm : fold;

void main() {
    writeln([12, 18, 24].fold!((a, b) => gcd(a, b))(0));
    writeln([7, 13].fold!((a, b) => gcd(a, b))(0));
}
