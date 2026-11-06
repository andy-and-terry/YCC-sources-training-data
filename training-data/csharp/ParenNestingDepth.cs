// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
using System;

class ParenNestingDepth
{
    static int MaxDepth(string s)
    {
        int depth = 0, best = 0;
        foreach (char ch in s)
        {
            if (ch == '(') best = Math.Max(best, ++depth);
            else if (ch == ')' && --depth < 0) return -1;
        }
        return depth == 0 ? best : -1;
    }

    static void Main() => Console.WriteLine($"{MaxDepth("(1+(2*(3)))")} {MaxDepth("(()")}");
}
