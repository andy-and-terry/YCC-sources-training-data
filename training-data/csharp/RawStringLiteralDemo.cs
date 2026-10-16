using System;

class RawStringLiteralDemo
{
    static void Main()
    {
        string json = """
            {
              "name": "demo",
              "path": "C:\temp\files",
              "quote": "she said \"hi\""
            }
            """;
        Console.WriteLine(json);

        int x = 5, y = 7;
        string interpolated = $$"""
            Point {"x": {{x}}, "y": {{y}}}
            """;
        Console.WriteLine(interpolated);

        string withQuotes = """"
            Contains """ three quotes
            """";
        Console.WriteLine(withQuotes);
        Console.WriteLine("""one line""".Length);
    }
}
