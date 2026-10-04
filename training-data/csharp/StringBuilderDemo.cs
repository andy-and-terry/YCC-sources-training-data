using System;
using System.Text;

class StringBuilderDemo
{
    static void Main()
    {
        var sb = new StringBuilder();
        for (int i = 1; i <= 5; i++)
        {
            sb.Append(i).Append(i < 5 ? ", " : "");
        }
        Console.WriteLine(sb);

        sb.Clear();
        sb.AppendLine("header");
        sb.AppendFormat("{0,-6}|{1,6:F2}", "pi", Math.PI).AppendLine();
        sb.Insert(0, ">> ");
        sb.Replace("header", "HEADER");
        Console.Write(sb.ToString());

        Console.WriteLine($"length={sb.Length}");
        sb.Length = 5;
        Console.WriteLine(sb);
    }
}
