using System;

class RelationalLogicalPatterns
{
    static string Classify(int score) => score switch
    {
        < 0 or > 100 => "invalid",
        >= 90 => "A",
        >= 80 => "B",
        >= 70 => "C",
        _ => "F"
    };

    static string CharKind(char c) => c switch
    {
        >= 'a' and <= 'z' => "lower",
        >= 'A' and <= 'Z' => "upper",
        >= '0' and <= '9' => "digit",
        ' ' or '\t' => "space",
        _ => "other"
    };

    static string Temp(double t) => t switch
    {
        < 0 => "freezing",
        >= 0 and < 15 => "cold",
        >= 15 and < 25 => "mild",
        _ => "hot"
    };

    static void Main()
    {
        foreach (int s in new[] { 95, 85, 72, 10, 101 }) Console.Write(Classify(s) + " ");
        Console.WriteLine();
        foreach (char c in "aZ5 !") Console.Write(CharKind(c) + " ");
        Console.WriteLine();
        Console.WriteLine(Temp(-3) + " " + Temp(20) + " " + Temp(31));
        object o = 42;
        Console.WriteLine(o is not null and int n && n > 40);
    }
}
