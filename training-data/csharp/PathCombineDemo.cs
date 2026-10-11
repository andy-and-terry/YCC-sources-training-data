using System;
using System.IO;

class PathCombineDemo
{
    static void Main()
    {
        string p = Path.Combine("home", "user", "docs", "report.final.txt");
        Console.WriteLine(p.Replace('\\', '/'));
        Console.WriteLine(Path.GetFileName(p));
        Console.WriteLine(Path.GetFileNameWithoutExtension(p));
        Console.WriteLine(Path.GetExtension(p));
        Console.WriteLine(Path.GetDirectoryName(p)!.Replace('\\', '/'));
        Console.WriteLine(Path.ChangeExtension(p, ".md").Replace('\\', '/'));
        Console.WriteLine(Path.IsPathRooted(p));
        Console.WriteLine(Path.HasExtension("Makefile"));
        Console.WriteLine(Path.Combine("a", "/abs", "b").Replace('\\', '/'));
        Console.WriteLine(Path.GetInvalidFileNameChars().Length > 0);
    }
}
