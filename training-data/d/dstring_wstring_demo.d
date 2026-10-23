import std.stdio;
import std.conv : to;

void main() {
    // D has three string widths: UTF-8, UTF-16, UTF-32
    string  s = "héllo wörld";
    wstring w = "héllo wörld"w;
    dstring d = "héllo wörld"d;

    writeln("string  length (bytes):    ", s.length);
    writeln("wstring length (units):    ", w.length);
    writeln("dstring length (code pts): ", d.length);

    // Indexing dstring gives one code point per element
    writeln(d[1]);
    writeln(d[7]);

    // Conversion between them
    dstring fromUtf8 = s.to!dstring;
    string  back     = fromUtf8.to!string;
    writeln(fromUtf8 == d);
    writeln(back == s);

    // Reverse safely on code points
    dchar[] chars = d.dup;
    foreach (i; 0 .. chars.length / 2) {
        auto tmp = chars[i];
        chars[i] = chars[$ - 1 - i];
        chars[$ - 1 - i] = tmp;
    }
    writeln(chars.to!string);

    // foreach with a dchar variable decodes automatically
    foreach (dchar c; "añb")
        writeln(cast(uint) c);
}
