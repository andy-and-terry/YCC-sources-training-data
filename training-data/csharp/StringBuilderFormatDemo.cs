using System;
using System.Globalization;
using System.Text;

class StringBuilderFormatDemo
{
    static void Main()
    {
        var sb = new StringBuilder();
        sb.AppendLine("Report")
          .AppendFormat("{0,-8}|{1,8:F2}", "Total", 1234.5)
          .AppendLine()
          .Append('-', 17)
          .AppendLine();
        sb.Insert(0, ">> ");
        Console.Write(sb.ToString());

        Console.WriteLine($"{255:X4} {0.256:P1} {1234567.891:N2}");
        Console.WriteLine(string.Format(CultureInfo.InvariantCulture, "{0:C}", 9.5));
        Console.WriteLine($"{DateTime.MinValue:yyyy-MM-dd}");
    }
}
