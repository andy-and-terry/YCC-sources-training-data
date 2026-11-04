import std.stdio;
import std.range : roundRobin;
import std.conv : to;

void main() {
    writeln(roundRobin("abc", "12345").to!string);
    writeln(roundRobin("ab", "cd", "efg").to!string);
}
