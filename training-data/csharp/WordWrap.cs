using System;
using System.Collections.Generic;
using System.Text;

class WordWrap
{
    static IEnumerable<string> Wrap(string text, int width)
    {
        var line = new StringBuilder();
        foreach (var raw in text.Split(' ', StringSplitOptions.RemoveEmptyEntries))
        {
            string word = raw;
            while (word.Length > width)
            {
                if (line.Length > 0)
                {
                    yield return line.ToString();
                    line.Clear();
                }
                yield return word[..width];
                word = word[width..];
            }
            if (line.Length == 0) line.Append(word);
            else if (line.Length + 1 + word.Length <= width) line.Append(' ').Append(word);
            else
            {
                yield return line.ToString();
                line.Clear().Append(word);
            }
        }
        if (line.Length > 0) yield return line.ToString();
    }

    static void Main()
    {
        foreach (var l in Wrap("The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically", 16))
            Console.WriteLine($"|{l,-16}|");
    }
}
