import std.stdio;
import std.regex;

void main() {
    auto re = regex(r"(\d{4})-(\d{2})-(\d{2})");
    auto m = matchFirst("Date: 2024-03-15!", re);
    if (m) {
        writeln(m[0]);
        writeln(m[1], "/", m[2], "/", m[3]);
    }

    foreach (hit; matchAll("a1b22c333", regex(r"\d+")))
        writeln(hit.hit);

    writeln(replaceAll("a  b   c", regex(r"\s+"), " "));
    writeln(replaceFirst("foo foo", regex("foo"), "bar"));
    writeln(!matchFirst("abc", r"^\d+$").empty);
}
