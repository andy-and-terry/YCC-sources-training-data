import std.stdio;
import std.algorithm : max, min;

alias Interval = int[2];

Interval[] insertInterval(Interval[] iv, Interval nw) {
    Interval[] output;
    size_t i = 0;
    while (i < iv.length && iv[i][1] < nw[0]) output ~= iv[i++];
    while (i < iv.length && iv[i][0] <= nw[1]) {
        nw = [min(nw[0], iv[i][0]), max(nw[1], iv[i][1])];
        i++;
    }
    output ~= nw;
    return output ~ iv[i .. $];
}

void main() {
    writeln(insertInterval([[1, 3], [6, 9]], [2, 5])); // [[1, 5], [6, 9]]
}
