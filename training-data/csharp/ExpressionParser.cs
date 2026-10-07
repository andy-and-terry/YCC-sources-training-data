using System;
using System.Collections.Generic;
using System.Globalization;

abstract record Expr;
record Num(double Value) : Expr;
record Var(string Name) : Expr;
record Neg(Expr Operand) : Expr;
record Bin(char Op, Expr Left, Expr Right) : Expr;

class ExpressionParser
{
    readonly string s;
    int pos;

    ExpressionParser(string s) => this.s = s.Replace(" ", "");

    public static Expr Parse(string text)
    {
        var p = new ExpressionParser(text);
        var e = p.ParseExpr();
        if (p.pos != p.s.Length) throw new FormatException($"unexpected '{p.s[p.pos]}' at {p.pos}");
        return e;
    }

    char Peek => pos < s.Length ? s[pos] : '\0';

    Expr ParseExpr()
    {
        var e = ParseTerm();
        while (Peek is '+' or '-') e = new Bin(s[pos++], e, ParseTerm());
        return e;
    }

    Expr ParseTerm()
    {
        var e = ParsePower();
        while (Peek is '*' or '/') e = new Bin(s[pos++], e, ParsePower());
        return e;
    }

    Expr ParsePower()
    {
        var b = ParseUnary();
        if (Peek != '^') return b;
        pos++;
        return new Bin('^', b, ParsePower());
    }

    Expr ParseUnary()
    {
        if (Peek != '-') return ParsePrimary();
        pos++;
        return new Neg(ParseUnary());
    }

    Expr ParsePrimary()
    {
        if (Peek == '(')
        {
            pos++;
            var e = ParseExpr();
            if (Peek != ')') throw new FormatException($"expected ')' at {pos}");
            pos++;
            return e;
        }
        int start = pos;
        if (char.IsLetter(Peek))
        {
            while (char.IsLetterOrDigit(Peek)) pos++;
            return new Var(s[start..pos]);
        }
        while (char.IsDigit(Peek) || Peek == '.') pos++;
        if (start == pos) throw new FormatException($"unexpected '{Peek}' at {pos}");
        return new Num(double.Parse(s[start..pos], CultureInfo.InvariantCulture));
    }

    static double Eval(Expr e, IReadOnlyDictionary<string, double> env) => e switch
    {
        Num n => n.Value,
        Var v => env[v.Name],
        Neg n => -Eval(n.Operand, env),
        Bin { Op: '+' } b => Eval(b.Left, env) + Eval(b.Right, env),
        Bin { Op: '-' } b => Eval(b.Left, env) - Eval(b.Right, env),
        Bin { Op: '*' } b => Eval(b.Left, env) * Eval(b.Right, env),
        Bin { Op: '/' } b => Eval(b.Left, env) / Eval(b.Right, env),
        Bin b => Math.Pow(Eval(b.Left, env), Eval(b.Right, env)),
        _ => throw new InvalidOperationException(),
    };

    static void Main()
    {
        var env = new Dictionary<string, double> { ["x"] = 2, ["y"] = 4 };
        foreach (var src in new[] { "1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y", "(1 + 2", "x / 0.5" })
        {
            try
            {
                Console.WriteLine($"{src,-14} = {Eval(Parse(src), env)}");
            }
            catch (FormatException e)
            {
                Console.WriteLine($"{src,-14} error: {e.Message}");
            }
        }
    }
}
