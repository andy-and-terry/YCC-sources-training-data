using System;
using System.Linq;

// Remove consecutive duplicates using indexed Where.
class DedupeAdjacent {
    static void Main() {
        string s = "aabbbcdd";
        Console.WriteLine(new string(s.Where((c, i) => i == 0 || c != s[i - 1]).ToArray()));
    }
}
