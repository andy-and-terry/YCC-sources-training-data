import std.stdio;

void main() {
    int[] data = [10, 20, 30, 40, 50, 60];

    int[] middle = data[1 .. 4];
    writeln(middle);

    middle[0] = 99;
    writeln(data);

    int[] copy = data[].dup;
    copy[$ - 1] = -1;
    writeln(data[$ - 1], " ", copy[$ - 1]);

    data ~= 70;
    writeln(data.length);
    writeln(data[2 .. $]);
    writeln(data[0 .. 0].length);
}
