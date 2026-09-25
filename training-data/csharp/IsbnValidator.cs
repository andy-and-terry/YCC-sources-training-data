using System;
using System.Linq;

abstract record IsbnResult;
record ValidIsbn(string Kind, string Digits) : IsbnResult;
record InvalidIsbn(string Reason) : IsbnResult;

class IsbnValidator
{
    static IsbnResult Validate(string raw)
    {
        string s = new string(raw.Where(c => c != '-' && c != ' ').ToArray()).ToUpperInvariant();
        switch (s.Length)
        {
            case 10:
                if (!s[..9].All(char.IsAsciiDigit) || !(char.IsAsciiDigit(s[9]) || s[9] == 'X')) return new InvalidIsbn("bad characters");
                int t10 = s.Select((c, i) => (10 - i) * (c == 'X' ? 10 : c - '0')).Sum();
                return t10 % 11 == 0 ? new ValidIsbn("ISBN-10", s) : new InvalidIsbn("checksum");
            case 13:
                if (!s.All(char.IsAsciiDigit)) return new InvalidIsbn("bad characters");
                int t13 = s.Select((c, i) => (c - '0') * (i % 2 == 0 ? 1 : 3)).Sum();
                return t13 % 10 == 0 ? new ValidIsbn("ISBN-13", s) : new InvalidIsbn("checksum");
            default:
                return new InvalidIsbn($"length {s.Length}");
        }
    }

    static void Main()
    {
        foreach (var s in new[] { "0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "0-8044-2957-X", "12345" })
        {
            string msg = Validate(s) switch
            {
                ValidIsbn v => $"valid {v.Kind}",
                InvalidIsbn e => $"invalid ({e.Reason})",
                _ => "?",
            };
            Console.WriteLine($"{s,-20} {msg}");
        }
    }
}
