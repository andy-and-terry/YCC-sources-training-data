using System;
using System.Text;

class ZigzagConvert
{
    static string Zigzag(string s, int rows)
    {
        if (rows == 1 || rows >= s.Length) return s;
        var lines = new StringBuilder[rows];
        for (int i = 0; i < rows; i++) lines[i] = new StringBuilder();
        int r = 0, step = 1;
        foreach (char c in s)
        {
            lines[r].Append(c);
            if (r == 0) step = 1;
            else if (r == rows - 1) step = -1;
            r += step;
        }
        return string.Concat<StringBuilder>(lines);
    }

    static void Main() => Console.WriteLine(Zigzag("PAYPALISHIRING", 3));
}
