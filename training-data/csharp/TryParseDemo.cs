using System;

class TryParseDemo
{
    static void Main()
    {
        string[] inputs = { "42", "-7", "3.14", "abc", "", "2147483648" };

        foreach (var text in inputs)
        {
            if (int.TryParse(text, out int value))
                Console.WriteLine($"'{text}' -> {value}");
            else
                Console.WriteLine($"'{text}' is not a valid int");
        }

        if (double.TryParse("3.14", System.Globalization.NumberStyles.Float,
                System.Globalization.CultureInfo.InvariantCulture, out var d))
            Console.WriteLine(d * 2);

        Console.WriteLine(bool.TryParse("True", out var flag) && flag);
        Console.WriteLine(Enum.TryParse<DayOfWeek>("Friday", out var day) ? day.ToString() : "none");
    }
}
