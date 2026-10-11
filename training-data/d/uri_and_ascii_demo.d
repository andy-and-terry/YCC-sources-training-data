import std.stdio;
import std.ascii;
import std.uni : toUpper, isAlpha;

void main() {
    foreach (c; "aZ5 _")
        writeln(c, " digit=", isDigit(c), " alpha=", isAlpha(c), " space=", isWhite(c));
    writeln("héllo".toUpper);
    writeln(toLower('Q'));
}
