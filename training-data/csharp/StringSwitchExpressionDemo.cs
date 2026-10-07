using System;

class StringSwitchExpressionDemo
{
    enum Op { Add, Sub, Mul, Div }

    static Op Parse(string s) => s switch
    {
        "+" => Op.Add,
        "-" => Op.Sub,
        "*" => Op.Mul,
        "/" => Op.Div,
        _ => throw new ArgumentException($"unknown op {s}")
    };

    static double Apply(Op op, double a, double b) => op switch
    {
        Op.Add => a + b,
        Op.Sub => a - b,
        Op.Mul => a * b,
        Op.Div when b == 0 => double.NaN,
        Op.Div => a / b,
        _ => throw new InvalidOperationException()
    };

    static void Main()
    {
        foreach (var sym in new[] { "+", "-", "*", "/" })
            Console.WriteLine($"8 {sym} 2 = {Apply(Parse(sym), 8, 2)}");
        Console.WriteLine(Apply(Op.Div, 1, 0));
    }
}
