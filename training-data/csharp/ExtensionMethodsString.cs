using System;
static class StringExt {
    public static string Truncate(this string s, int n) => s.Length <= n ? s : s[..n] + "...";
    public static bool IsPalindrome(this string s) {
        var t = s.ToLowerInvariant();
        for (int i = 0, j = t.Length - 1; i < j; i++, j--) if (t[i] != t[j]) return false;
        return true;
    }
}
class Program {
    static void Main() {
        Console.WriteLine("abcdefgh".Truncate(4));
        Console.WriteLine("Level".IsPalindrome());
    }
}
