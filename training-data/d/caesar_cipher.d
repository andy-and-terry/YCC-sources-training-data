import std.stdio;
import std.algorithm : map;
import std.ascii : isLower, isUpper;
import std.conv : to;

char shift(char c, int k)
{
    if (isLower(c)) return cast(char)('a' + (c - 'a' + k + 26) % 26);
    if (isUpper(c)) return cast(char)('A' + (c - 'A' + k + 26) % 26);
    return c;
}

string caesar(string s, int k)
{
    return s.map!(c => shift(c, k)).to!string;
}

void main()
{
    auto enc = caesar("Hello, World!", 3);
    writeln(enc);
    writeln(caesar(enc, -3));
}
