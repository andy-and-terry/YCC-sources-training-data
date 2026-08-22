using System;

interface IExpr
{
    int Accept(IVisitor visitor);
}

interface IVisitor
{
    int VisitNumber(NumberExpr n);
    int VisitAdd(AddExpr a);
}

class NumberExpr : IExpr
{
    public int Value;
    public NumberExpr(int value) => Value = value;
    public int Accept(IVisitor visitor) => visitor.VisitNumber(this);
}

class AddExpr : IExpr
{
    public IExpr Left, Right;
    public AddExpr(IExpr left, IExpr right) { Left = left; Right = right; }
    public int Accept(IVisitor visitor) => visitor.VisitAdd(this);
}

class EvalVisitor : IVisitor
{
    public int VisitNumber(NumberExpr n) => n.Value;
    public int VisitAdd(AddExpr a) => a.Left.Accept(this) + a.Right.Accept(this);
}

class VisitorPatternDemo
{
    static void Main()
    {
        IExpr expr = new AddExpr(new NumberExpr(1), new AddExpr(new NumberExpr(2), new NumberExpr(3)));
        Console.WriteLine(expr.Accept(new EvalVisitor()));
    }
}
