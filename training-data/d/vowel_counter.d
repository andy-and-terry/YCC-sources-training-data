import std.stdio, std.uni, std.algorithm;

void main() {
    int[dchar] counts;
    foreach (c; "Education is beautiful".toLower)
        if ("aeiou".canFind(c)) counts[c]++;
    foreach (k; counts.keys.sort) writef("%s=%d ", k, counts[k]);
    writeln();
}
