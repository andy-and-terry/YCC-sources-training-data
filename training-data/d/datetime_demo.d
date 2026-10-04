import std.stdio;
import std.datetime;

void main()
{
    auto d = Date(2024, 2, 28);
    writeln(d + dur!"days"(2));
    writeln(d.dayOfWeek);
    writeln(d.isLeapYear);
    writeln(d.endOfMonth);

    auto d2 = Date(2024, 12, 25);
    writeln("days until xmas: ", (d2 - d).total!"days");

    auto t = TimeOfDay(13, 45, 10);
    writeln(t);
    auto dt = DateTime(d, t);
    writeln(dt.toISOExtString());

    Duration dur = dur!"hours"(2) + dur!"minutes"(30);
    writeln(dur.total!"minutes");
}
