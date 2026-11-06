// Integer (1..3999) to Roman numeral using a greedy table.
using System;
using System.Text;

class IntToRoman
{
    static readonly (int Value, string Symbol)[] Table =
    {
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
        (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I"),
    };

    static string ToRoman(int n)
    {
        var sb = new StringBuilder();
        foreach (var (value, symbol) in Table)
            while (n >= value) { sb.Append(symbol); n -= value; }
        return sb.ToString();
    }

    static void Main() => Console.WriteLine($"{ToRoman(1994)} {ToRoman(58)}");
}
