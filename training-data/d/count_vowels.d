import std.stdio;
import std.algorithm : canFind;

int countVowels(string s) {
    int count = 0;
    foreach (c; s) {
        if ("aeiou".canFind(c)) count++;
    }
    return count;
}

void main() {
    writeln(countVowels("hello world"));
}
