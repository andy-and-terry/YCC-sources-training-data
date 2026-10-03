import std.stdio;

void backtrack(ref string[] result, string current, int open, int close, int max) {
    if (current.length == max * 2) {
        result ~= current;
        return;
    }
    if (open < max) backtrack(result, current ~ "(", open + 1, close, max);
    if (close < open) backtrack(result, current ~ ")", open, close + 1, max);
}

void main() {
    string[] result;
    backtrack(result, "", 0, 0, 3);
    writeln(result);
}
