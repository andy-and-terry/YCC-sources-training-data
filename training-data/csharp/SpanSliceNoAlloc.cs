using System;
class Program {
    static void Main() {
        int[] data = { 1, 2, 3, 4, 5, 6 };
        Span<int> mid = data.AsSpan(1, 3);
        mid[0] = 99;
        Console.WriteLine(string.Join(",", data));
        ReadOnlySpan<char> s = "key=value".AsSpan();
        int i = s.IndexOf('=');
        Console.WriteLine(s[..i].ToString() + "|" + s[(i + 1)..].ToString());
    }
}
