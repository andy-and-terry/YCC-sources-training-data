using System;
using System.Text;

class StringBuilderDemo
{
    static void Main()
    {
        var sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            sb.Append(i);
            if (i < 5) sb.Append(", ");
        }
        sb.Insert(0, "[").Append(']');
        Console.WriteLine(sb);

        sb.Replace(", ", "-");
        Console.WriteLine(sb);
        sb.Length -= 1;
        Console.WriteLine(sb);

        var lines = new StringBuilder()
            .AppendLine("first")
            .AppendFormat("{0}:{1:D3}", "id", 7)
            .ToString();
        Console.WriteLine(lines);
    }
}
