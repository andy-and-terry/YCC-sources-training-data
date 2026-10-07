using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

enum TokenKind { Number, String, Ident, Keyword, Op }

record Token(TokenKind Kind, string Text, int Line, int Col);

class TokenizerLexer
{
    static readonly Regex Master = new(
        @"(?<num>\d+(?:\.\d+)?)|(?<str>""(?:[^""\\]|\\.)*"")|(?<id>[A-Za-z_]\w*)|(?<op>==|!=|<=|>=|=>|&&|\|\||[-+*/=<>(){};,.])|(?<nl>\n)|(?<ws>[ \t]+|//[^\n]*)|(?<bad>.)",
        RegexOptions.Compiled);

    static readonly HashSet<string> Keywords = new() { "var", "if", "else", "while", "return", "int" };

    static IEnumerable<Token> Tokenize(string src)
    {
        int line = 1, lineStart = 0;
        foreach (Match m in Master.Matches(src))
        {
            int col = m.Index - lineStart + 1;
            if (m.Groups["nl"].Success)
            {
                line++;
                lineStart = m.Index + 1;
            }
            else if (m.Groups["ws"].Success) { }
            else if (m.Groups["bad"].Success) throw new FormatException($"unexpected '{m.Value}' at {line}:{col}");
            else
            {
                var kind = m.Groups["num"].Success ? TokenKind.Number
                    : m.Groups["str"].Success ? TokenKind.String
                    : m.Groups["op"].Success ? TokenKind.Op
                    : Keywords.Contains(m.Value) ? TokenKind.Keyword : TokenKind.Ident;
                yield return new Token(kind, m.Value, line, col);
            }
        }
    }

    static void Main()
    {
        foreach (var t in Tokenize("var x = 3.5 * (y + 2); // note\nif (x >= 10 && ok) { print(\"big\"); }"))
            Console.WriteLine($"{t.Line}:{t.Col,-3} {t.Kind,-8} {t.Text}");
        try
        {
            foreach (var _ in Tokenize("a # b")) { }
        }
        catch (FormatException e)
        {
            Console.WriteLine($"error: {e.Message}");
        }
    }
}
