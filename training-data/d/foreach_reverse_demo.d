import std.stdio;

void main() {
    int[] values = [1, 2, 3, 4, 5];

    foreach_reverse (v; values) {
        write(v, " ");
    }
    writeln();

    foreach_reverse (i, v; values) {
        if (i % 2 == 0) writef("[%s]=%s ", i, v);
    }
    writeln();

    foreach (ref v; values) {
        v *= 10;
    }
    writeln(values);

    string word = "stressed";
    foreach_reverse (c; word) write(c);
    writeln();

    foreach (i; 0 .. 3) write(i);
    writeln();
    foreach_reverse (i; 0 .. 3) write(i);
    writeln();
}
