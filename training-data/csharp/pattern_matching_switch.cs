using System;

class PatternMatchingSwitch {
    static string Describe(object o) => o switch {
        int n when n < 0 => "negative int",
        int => "int",
        string { Length: 0 } => "empty string",
        string s => $"string {s}",
        null => "null",
        _ => "other",
    };

    static void Main() {
        foreach (var o in new object?[] { -1, 5, "", "hi", null, 2.5 }) Console.WriteLine(Describe(o));
    }
}
