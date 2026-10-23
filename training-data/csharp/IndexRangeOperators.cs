using System;

public static class IndexRangeOperators
{
    public static void Main()
    {
        int[] numbers = { 10, 20, 30, 40, 50, 60 };

        Console.WriteLine(numbers[^1]);
        Console.WriteLine(numbers[^2]);
        Console.WriteLine(string.Join(",", numbers[1..4]));
        Console.WriteLine(string.Join(",", numbers[..2]));
        Console.WriteLine(string.Join(",", numbers[^3..]));

        string word = "operators";
        Console.WriteLine(word[2..6]);
    }
}
