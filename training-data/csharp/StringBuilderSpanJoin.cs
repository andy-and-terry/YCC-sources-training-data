using System;
using System.Text;

class StringBuilderSpanJoin
{
    static void Main()
    {
        var sb = new StringBuilder();
        for (int i = 0; i < 5; i++) sb.Append(i).Append(i < 4 ? "," : "");
        sb.Insert(0, "[").Append(']').Replace(",", ", ");
        Console.WriteLine(sb + " " + sb.Length);
        Console.WriteLine(string.Concat("a", "b") + string.Join("-", 1, 2, 3) + "x".PadLeft(3, '.') + " abc ".Trim().ToUpperInvariant());
        Console.WriteLine("a,b,,c".Split(',', StringSplitOptions.RemoveEmptyEntries).Length + " " + "hello".Contains("ell") + " " + "Hello".IndexOf('l') + " " + string.Compare("a", "B", StringComparison.OrdinalIgnoreCase));
    }
}
