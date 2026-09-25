using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class TextJustification
{
    static List<string> Justify(string[] words, int width)
    {
        var lines = new List<string>();
        for (int i = 0; i < words.Length;)
        {
            int j = i, len = 0;
            while (j < words.Length && len + words[j].Length + (j - i) <= width) len += words[j++].Length;
            int gaps = j - i - 1;
            if (j == words.Length || gaps == 0)
            {
                lines.Add(string.Join(" ", words[i..j]).PadRight(width));
            }
            else
            {
                int spaces = (width - len) / gaps, extra = (width - len) % gaps;
                var sb = new StringBuilder();
                for (int k = i; k < j - 1; k++) sb.Append(words[k]).Append(' ', spaces + (k - i < extra ? 1 : 0));
                lines.Add(sb.Append(words[j - 1]).ToString());
            }
            i = j;
        }
        return lines;
    }

    static void Main()
    {
        var words = "This is an example of text justification done greedily line by line".Split(' ');
        Justify(words, 20).ForEach(l => Console.WriteLine($"[{l}]"));
    }
}
