using System;

enum Season { Winter, Spring, Summer, Autumn }

class SwitchExpressionDemo
{
    static string Describe(Season s) => s switch
    {
        Season.Winter => "cold",
        Season.Spring or Season.Autumn => "mild",
        Season.Summer => "hot",
        _ => throw new ArgumentOutOfRangeException(nameof(s))
    };

    static string Grade(int score) => score switch
    {
        >= 90 => "A",
        >= 80 => "B",
        >= 70 => "C",
        < 0 => "invalid",
        _ => "F"
    };

    static void Main()
    {
        foreach (Season s in Enum.GetValues<Season>())
            Console.WriteLine($"{s}: {Describe(s)}");
        foreach (int score in new[] { 95, 85, 72, 40, -1 })
            Console.WriteLine($"{score} -> {Grade(score)}");
    }
}
