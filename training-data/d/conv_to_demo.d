import std.stdio;
import std.conv;
import std.exception : collectException;

void main() {
    writeln("123".to!int + 1);
    writeln(3.99.to!int);
    writeln(65.to!char);
    writeln(42.to!string ~ "!");
    writeln("ff".to!int(16));
    writeln(255.to!string(2));
    writeln([1, 2, 3].to!(string[]));

    auto e = collectException!ConvException("abc".to!int);
    writeln(e !is null);

    try {
        ubyte b = 300.to!ubyte;
    } catch (ConvOverflowException ex) {
        writeln("overflow");
    }
    string rest = "77 rest";
    writeln(parse!int(rest));
}
