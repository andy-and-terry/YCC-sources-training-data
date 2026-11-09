using System;

class Program {
    static void Main() {
        int[] data = { 1, 2, 3, 4, 5, 6 };
        Span<int> s = data.AsSpan(1, 3);
        s[0] = 99;
        Console.WriteLine(string.Join(",", data));
    }
}
