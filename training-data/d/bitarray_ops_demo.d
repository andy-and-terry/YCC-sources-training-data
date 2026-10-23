import std.stdio;
import std.bitmanip : BitArray;

void main() {
    // BitArray stores one bit per element
    BitArray bits;
    bits.length = 10;
    bits[1] = true;
    bits[3] = true;
    bits[4] = true;
    bits[9] = true;

    writeln(bits);
    writeln("length: ", bits.length);
    writeln("count: ", bits.count);
    writeln("bit 3: ", bits[3]);

    bits.flip(3);
    writeln("after flip: ", bits);

    // Bitwise operators work on same-length arrays
    BitArray other;
    other.length = 10;
    other[1] = true;
    other[2] = true;
    other[9] = true;

    writeln("and: ", bits & other);
    writeln("or:  ", bits | other);
    writeln("xor: ", bits ^ other);

    foreach (i, b; bits)
        if (b) write(i, " ");
    writeln();
}
