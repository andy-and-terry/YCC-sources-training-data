import std.stdio;
import std.datetime;

void main() {
    auto d = Date(2024, 2, 28);
    writeln(d + days(2));
    writeln(d.dayOfWeek);
    writeln(d.isLeapYear);
    writeln(d.daysInMonth);
    writeln(d.endOfMonth);

    auto d2 = Date(2024, 12, 25);
    writeln((d2 - d).total!"days");

    auto t = TimeOfDay(13, 45, 10);
    writeln(t);
    auto dt = DateTime(d, t);
    writeln(dt.toISOExtString());
    writeln(dur!"minutes"(90).total!"hours");
}
