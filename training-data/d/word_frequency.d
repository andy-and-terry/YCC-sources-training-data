import std.stdio;
import std.string : split, toLower;

void main() {
    string text = "the quick brown fox jumps over the lazy dog the fox runs";
    int[string] counts;
    foreach (word; text.toLower().split(" ")) {
        counts[word]++;
    }
    foreach (word, count; counts) {
        writeln(word, ": ", count);
    }
}
