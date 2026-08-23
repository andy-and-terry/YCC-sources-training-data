import std.stdio;
import std.conv : to;
import std.math : pow;

bool isArmstrong(int n) {
    auto s = to!string(n);
    int power = cast(int) s.length;
    int sum = 0;
    foreach (c; s) {
        int digit = c - '0';
        sum += cast(int) pow(digit, power);
    }
    return sum == n;
}

void main() {
    writeln(isArmstrong(153));
    writeln(isArmstrong(123));
}
