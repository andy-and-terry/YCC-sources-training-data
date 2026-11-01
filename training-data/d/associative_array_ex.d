import std.stdio, std.algorithm, std.array;

void main() {
    int[string] ages = ["ann": 30, "bob": 25];
    ages["cy"] = 41;
    if (auto p = "bob" in ages) writeln("bob ", *p);
    foreach (k; ages.keys.sort()) writeln(k, " ", ages[k]);
    ages.remove("ann");
    writeln(ages.length);
}
