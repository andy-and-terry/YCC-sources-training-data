using System;

class StringInterpolationDemo
{
    static void Main()
    {
        string item = "widget";
        int qty = 7;
        double price = 4.5;

        Console.WriteLine($"{item} x{qty}");
        Console.WriteLine($"total: {qty * price:F2}");
        Console.WriteLine($"[{item,10}]");
        Console.WriteLine($"[{item,-10}]");
        Console.WriteLine($"hex: {255:X4}");
        Console.WriteLine($"percent: {0.256:P1}");
        Console.WriteLine($"{(qty > 5 ? "bulk" : "single")} order");
        Console.WriteLine($"braces: {{literal}}");
        Console.WriteLine($@"path: C:\temp\{item}");

        string raw = """
            {"item": "widget", "qty": 7}
            """;
        Console.WriteLine(raw);
    }
}
