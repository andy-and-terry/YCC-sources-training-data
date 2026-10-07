using System;

class NamedOptionalArguments
{
    static string Format(string text, bool bold = false, bool italic = false, int indent = 0)
    {
        string result = text;
        if (bold) result = $"**{result}**";
        if (italic) result = $"_{result}_";
        return new string(' ', indent) + result;
    }

    static void Main()
    {
        Console.WriteLine(Format("plain"));
        Console.WriteLine(Format("bold", bold: true));
        Console.WriteLine(Format("both", italic: true, bold: true));
        Console.WriteLine(Format(indent: 4, text: "indented"));
        Console.WriteLine(Format("mixed", true, indent: 2));
    }
}
