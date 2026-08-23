import std.stdio;
import std.conv : to;

int binaryToDecimal(string bin) {
    return to!int(bin, 2);
}

void main() {
    writeln(binaryToDecimal("1010"));
    writeln(binaryToDecimal("11111111"));
}
