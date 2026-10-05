using System;
using System.Text;

class StringBuilderDemo
{
    static void Main()
    {
        var sb = new StringBuilder();
        sb.Append("Hello");
        sb.Append(',').Append(' ').Append("World");
        sb.AppendLine("!");
        sb.AppendFormat("{0} + {1} = {2}", 2, 3, 2 + 3).AppendLine();

        sb.Insert(0, ">> ");
        sb.Replace("World", "C#");
        Console.Write(sb.ToString());
        Console.WriteLine($"Length: {sb.Length}");

        sb.Clear();
        for (int i = 1; i <= 5; i++)
            sb.Append(i).Append(i < 5 ? "-" : "");
        Console.WriteLine(sb);
    }
}
