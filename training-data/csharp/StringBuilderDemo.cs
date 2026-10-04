using System;
using System.Text;

class StringBuilderDemo
{
    static void Main()
    {
        var sb = new StringBuilder();
        sb.Append("Report").AppendLine();
        for (int i = 1; i <= 3; i++)
            sb.AppendFormat("{0,2}. item-{0}", i).AppendLine();

        sb.Insert(0, ">> ");
        sb.Replace("item", "entry");
        Console.Write(sb.ToString());
        Console.WriteLine($"length={sb.Length}");

        sb.Clear();
        sb.Append('x', 5).Append(3.5).Append(true);
        Console.WriteLine(sb);

        sb.Length = 3;
        Console.WriteLine(sb);
        Console.WriteLine(sb[1]);
    }
}
