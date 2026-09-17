using System;
using System.Text;

class RomanNumerals
{
    private static readonly int[] Values = { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    private static readonly string[] Symbols = { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };

    static string ToRoman(int number)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < Values.Length; i++)
        {
            while (number >= Values[i])
            {
                sb.Append(Symbols[i]);
                number -= Values[i];
            }
        }
        return sb.ToString();
    }

    static void Main()
    {
        foreach (var n in new[] { 3, 58, 1994, 2024 })
        {
            Console.WriteLine($"{n} -> {ToRoman(n)}");
        }
    }
}
