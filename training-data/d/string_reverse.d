import std.stdio;
import std.algorithm : reverse;

void main() {
    char[] s = "hello world".dup;
    reverse(s);
    writeln(s);
}
