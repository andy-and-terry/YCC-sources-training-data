using System;

class SpanStackallocParsing
{
    static int SumCsv(ReadOnlySpan<char> s)
    {
        int total = 0;
        while (!s.IsEmpty)
        {
            int i = s.IndexOf(',');
            var tok = i < 0 ? s : s[..i];
            total += int.Parse(tok);
            s = i < 0 ? ReadOnlySpan<char>.Empty : s[(i + 1)..];
        }
        return total;
    }

    static void Main()
    {
        Console.WriteLine(SumCsv("10,20,30"));
        Span<int> buf = stackalloc int[4];
        buf[2] = 9;
        buf.Fill(1);
        Console.WriteLine(buf.Length + " " + buf[2]);
    }
}
