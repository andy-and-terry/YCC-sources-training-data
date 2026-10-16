import std.stdio;
import std.array : appender;

void main() {
    auto app = appender!(int[]);
    foreach (i; 0 .. 6) app.put(i * 3);
    app ~= 100;
    writeln(app.data);
    writeln(app.data.length);
    app.clear();
    writeln(app.data.length);
}
