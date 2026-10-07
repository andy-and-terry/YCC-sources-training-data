import std.stdio;
import std.algorithm;

void main() {
    string[] words = ["eat", "tea", "tan", "ate", "nat", "bat"];
    string[][string] groups;

    foreach (word; words) {
        auto key = word.dup.sort.release.idup;
        groups[key] ~= word;
    }

    foreach (key, value; groups) {
        writeln(value);
    }
}
