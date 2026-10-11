using System;
using System.Globalization;

class StringComparisonDemo
{
    static void Main()
    {
        string a = "Straße", b = "STRASSE", c = "apple", d = "Apple";

        Console.WriteLine(string.Equals(c, d));
        Console.WriteLine(string.Equals(c, d, StringComparison.OrdinalIgnoreCase));
        Console.WriteLine(string.Compare(c, d, StringComparison.Ordinal));
        Console.WriteLine(string.Compare(c, d, StringComparison.OrdinalIgnoreCase));
        Console.WriteLine(c.CompareTo(d) < 0);
        Console.WriteLine(a.Equals(b, StringComparison.InvariantCultureIgnoreCase));
        Console.WriteLine("istanbul".StartsWith("IST", StringComparison.OrdinalIgnoreCase));
        Console.WriteLine("hello world".IndexOf("WORLD", StringComparison.OrdinalIgnoreCase));
        Console.WriteLine("a-b".Contains('-'));
        Console.WriteLine(string.IsNullOrWhiteSpace("  \t"));
        Console.WriteLine("TITLE".ToLowerInvariant());
    }
}
