using System;
using System.Collections.Generic;
using System.Linq;

class LetterCombinationsPhone
{
    static readonly string[] Keys = { "", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz" };

    static IEnumerable<string> Combinations(string digits) =>
        digits.Length == 0
            ? Enumerable.Empty<string>()
            : digits.Aggregate(new[] { "" }.AsEnumerable(), (acc, d) => acc.SelectMany(prefix => Keys[d - '0'].Select(c => prefix + c)));

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Combinations("23")));
        Console.WriteLine(Combinations("7979").Count());
    }
}
