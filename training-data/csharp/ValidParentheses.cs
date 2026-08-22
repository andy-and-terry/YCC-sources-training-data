using System;
using System.Collections.Generic;

class ValidParenthesesDemo
{
    static bool IsValid(string s)
    {
        var pairs = new Dictionary<char, char> { { ')', '(' }, { ']', '[' }, { '}', '{' } };
        var stack = new Stack<char>();
        foreach (char ch in s)
        {
            if (ch == '(' || ch == '[' || ch == '{') stack.Push(ch);
            else if (pairs.ContainsKey(ch))
            {
                if (stack.Count == 0 || stack.Pop() != pairs[ch]) return false;
            }
        }
        return stack.Count == 0;
    }

    static void Main()
    {
        Console.WriteLine(IsValid("([{}])"));
        Console.WriteLine(IsValid("([)]"));
    }
}
