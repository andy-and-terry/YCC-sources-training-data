using System;
using System.Collections.Generic;
using System.Linq;

class MorseCode
{
    static readonly Dictionary<char, string> Table = new()
    {
        ['A'] = ".-", ['B'] = "-...", ['C'] = "-.-.", ['D'] = "-..", ['E'] = ".", ['F'] = "..-.", ['G'] = "--.",
        ['H'] = "....", ['I'] = "..", ['J'] = ".---", ['K'] = "-.-", ['L'] = ".-..", ['M'] = "--", ['N'] = "-.",
        ['O'] = "---", ['P'] = ".--.", ['Q'] = "--.-", ['R'] = ".-.", ['S'] = "...", ['T'] = "-", ['U'] = "..-",
        ['V'] = "...-", ['W'] = ".--", ['X'] = "-..-", ['Y'] = "-.--", ['Z'] = "--..", ['0'] = "-----",
        ['1'] = ".----", ['2'] = "..---", ['3'] = "...--", ['4'] = "....-", ['5'] = ".....", ['6'] = "-....",
        ['7'] = "--...", ['8'] = "---..", ['9'] = "----.",
    };

    static readonly Dictionary<string, char> Reverse = Table.ToDictionary(kv => kv.Value, kv => kv.Key);

    static string Encode(string text) =>
        string.Join(" / ", text.ToUpperInvariant().Split(' ', StringSplitOptions.RemoveEmptyEntries)
            .Select(w => string.Join(" ", w.Where(Table.ContainsKey).Select(c => Table[c]))));

    static string Decode(string code) =>
        string.Join(" ", code.Split(" / ").Select(w => string.Concat(w.Split(' ').Select(s => Reverse.GetValueOrDefault(s, '?')))));

    static void Main()
    {
        string m = Encode("SOS help 2024");
        Console.WriteLine(m);
        Console.WriteLine(Decode(m));
    }
}
