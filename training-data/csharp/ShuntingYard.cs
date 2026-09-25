using System;
using System.Collections.Generic;
using System.Globalization;

class ShuntingYard
{
    static readonly Dictionary<string, (int Prec, bool Right)> Ops = new()
    {
        ["+"] = (1, false), ["-"] = (1, false), ["*"] = (2, false), ["/"] = (2, false), ["^"] = (3, true),
    };

    static List<string> ToRpn(string infix)
    {
        var output = new List<string>();
        var stack = new Stack<string>();
        foreach (var t in infix.Split(' ', StringSplitOptions.RemoveEmptyEntries))
        {
            if (Ops.TryGetValue(t, out var op))
            {
                while (stack.TryPeek(out var top) && Ops.TryGetValue(top, out var topOp) &&
                       (topOp.Prec > op.Prec || (topOp.Prec == op.Prec && !op.Right)))
                    output.Add(stack.Pop());
                stack.Push(t);
            }
            else if (t == "(") stack.Push(t);
            else if (t == ")")
            {
                while (stack.Peek() != "(") output.Add(stack.Pop());
                stack.Pop();
            }
            else output.Add(t);
        }
        while (stack.Count > 0) output.Add(stack.Pop());
        return output;
    }

    static double Eval(IEnumerable<string> rpn)
    {
        var st = new Stack<double>();
        foreach (var t in rpn)
        {
            if (!Ops.ContainsKey(t))
            {
                st.Push(double.Parse(t, CultureInfo.InvariantCulture));
                continue;
            }
            double b = st.Pop(), a = st.Pop();
            st.Push(t switch { "+" => a + b, "-" => a - b, "*" => a * b, "/" => a / b, _ => Math.Pow(a, b) });
        }
        return st.Pop();
    }

    static void Main()
    {
        var rpn = ToRpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3");
        Console.WriteLine($"{string.Join(" ", rpn)} = {Eval(rpn)}");
    }
}
