import std.stdio;
import std.regex;
import std.array : array;

void main() {
    auto date = regex(`(\d{4})-(\d{2})-(\d{2})`);
    auto m = matchFirst("Shipped 2023-11-05 and 2024-01-09", date);
    if (m) {
        writeln(m[0]);
        writeln(m[1], "/", m[2], "/", m[3]);
    }

    foreach (hit; matchAll("a1 b22 c333", regex(`[a-z]\d+`)))
        writeln(hit.hit);

    writeln(replaceAll("2023-11-05 2024-01-09", date, "$3.$2.$1"));
    writeln("hello   world  d".split(regex(`\s+`)));
    writeln(matchFirst("abc", `^\d+$`).empty);
    writeln(replaceFirst("foo foo", regex("foo"), "bar"));
}
