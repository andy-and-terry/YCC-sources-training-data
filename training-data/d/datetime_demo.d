import std.stdio;
import std.datetime;

void main() {
    auto d = Date(2024, 2, 28);
    writeln(d);
    writeln(d + days(2));
    writeln(d.dayOfWeek);
    writeln(d.isLeapYear);
    writeln(d.daysInMonth);

    auto later = Date(2024, 12, 25);
    writeln((later - d).total!"days");

    auto t = TimeOfDay(13, 45, 30);
    writeln(t);

    auto dt = DateTime(d, t);
    writeln(dt.toISOExtString());
    writeln(DateTime.fromISOExtString("2030-01-02T03:04:05").year);

    auto span = dur!"hours"(90);
    writeln(span.total!"days", " days ", span.split!("days", "hours").hours, " hours");
}
