using System;
using System.IO;
using System.Text;

class StringReaderWriterDemo
{
    static void Main()
    {
        var sw = new StringWriter();
        sw.WriteLine("id,name");
        sw.WriteLine("1,ada");
        sw.Write("2,");
        sw.Write("linus");
        sw.WriteLine();
        string text = sw.ToString();

        using var reader = new StringReader(text);
        string? line;
        int n = 0;
        while ((line = reader.ReadLine()) != null)
        {
            if (n++ == 0) continue;
            var parts = line.Split(',');
            Console.WriteLine($"{parts[0]} -> {parts[1].ToUpper()}");
        }

        using var r2 = new StringReader("abc");
        Console.WriteLine((char)r2.Read() + "" + (char)r2.Peek() + r2.ReadToEnd());

        var sb = new StringBuilder();
        using (var w = new StringWriter(sb)) w.Write("via builder");
        Console.WriteLine(sb);
    }
}
