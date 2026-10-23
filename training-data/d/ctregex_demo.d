import std.stdio;
import std.regex;

void main()
{
    // ctRegex compiles the pattern at compile time.
    enum datePattern = ctRegex!(`(\d{4})-(\d{2})-(\d{2})`);

    auto m = matchFirst("released on 2024-03-15!", datePattern);
    if (m)
    {
        writeln("year: ", m[1], " month: ", m[2], " day: ", m[3]);
        writeln("before: '", m.pre, "' after: '", m.post, "'");
    }

    foreach (hit; matchAll("a1 b22 c333", ctRegex!`\d+`))
        writeln("number: ", hit.hit);

    writeln(replaceAll("a-b-c", ctRegex!"-", "+"));
}
