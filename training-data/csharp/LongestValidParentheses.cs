using System;
using System.Collections.Generic;

class LongestValidParentheses
{
    static int Longest(string s)
    {
        var stack = new Stack<int>();
        stack.Push(-1);
        int best = 0;
        for (int i = 0; i < s.Length; i++)
        {
            if (s[i] == '(')
            {
                stack.Push(i);
                continue;
            }
            stack.Pop();
            if (stack.Count == 0) stack.Push(i);
            else best = Math.Max(best, i - stack.Peek());
        }
        return best;
    }

    static void Main()
    {
        foreach (var s in new[] { "(()", ")()())", "", "()(()", "((()))()" }) Console.WriteLine($"\"{s}\" {Longest(s)}");
    }
}
