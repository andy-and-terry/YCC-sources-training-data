import std.stdio;
import std.regex;

void main() {
    auto date = regex(r"(\d{4})-(\d{2})-(\d{2})");
    auto m = matchFirst("released on 2023-07-14 today", date);
    if (m) {
        writeln("year=", m[1], " month=", m[2], " day=", m[3]);
        writeln("pre: ", m.pre);
    }

    foreach (hit; matchAll("a1 b22 c333", regex(r"[a-z]\d+"))) {
        writeln(hit.hit);
    }

    writeln(replaceAll("hello  big   world", regex(r"\s+"), " "));
    writeln(replaceFirst("aaa", regex("a"), "b"));
    writeln(matchFirst("no digits", regex(r"\d")).empty);
    writeln(split("one, two;three", regex(r"[,;]\s*")));
}
