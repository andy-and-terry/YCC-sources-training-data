import std.stdio;

void main() {
    int[] nums = [1, 2, 3, 4];

    foreach (ref n; nums)
        n *= 10;
    writeln(nums);

    foreach (i, n; nums)
        writefln("nums[%d] = %d", i, n);

    foreach_reverse (n; nums)
        write(n, " ");
    writeln();

    string word = "héllo";
    foreach (char c; word) write(cast(int) c, " ");
    writeln();
    foreach (dchar c; word) write(c, ".");
    writeln();

    int[string] ages = ["ann": 30, "bob": 25];
    foreach (name, ref age; ages)
        age++;
    writeln(ages["ann"], " ", ages["bob"]);

    foreach (i; 0 .. 3)
        write(i);
    writeln();
}
