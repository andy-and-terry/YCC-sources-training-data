using System;

interface IExpression
{
    int Interpret();
}

class NumberExpression : IExpression
{
    private readonly int value;
    public NumberExpression(int value) => this.value = value;
    public int Interpret() => value;
}

class AddExpression : IExpression
{
    private readonly IExpression left;
    private readonly IExpression right;
    public AddExpression(IExpression left, IExpression right)
    {
        this.left = left;
        this.right = right;
    }
    public int Interpret() => left.Interpret() + right.Interpret();
}

class SubtractExpression : IExpression
{
    private readonly IExpression left;
    private readonly IExpression right;
    public SubtractExpression(IExpression left, IExpression right)
    {
        this.left = left;
        this.right = right;
    }
    public int Interpret() => left.Interpret() - right.Interpret();
}

class InterpreterPatternDemo
{
    static void Main()
    {
        // (5 + 3) - 2
        IExpression expr = new SubtractExpression(
            new AddExpression(new NumberExpression(5), new NumberExpression(3)),
            new NumberExpression(2));

        Console.WriteLine(expr.Interpret());
    }
}
