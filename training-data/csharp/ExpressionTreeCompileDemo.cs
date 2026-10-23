using System;
using System.Linq.Expressions;

class ExpressionTreeCompileDemo
{
    static void Main()
    {
        // Code as data: build x => x * x + 1 by hand.
        ParameterExpression x = Expression.Parameter(typeof(int), "x");
        Expression body = Expression.Add(Expression.Multiply(x, x), Expression.Constant(1));
        var lambda = Expression.Lambda<Func<int, int>>(body, x);

        Console.WriteLine(lambda);               // x => ((x * x) + 1)
        Func<int, int> compiled = lambda.Compile();
        Console.WriteLine(compiled(5));

        // The compiler can also capture a lambda as an expression tree.
        Expression<Func<int, bool>> isEven = n => n % 2 == 0;
        var binary = (BinaryExpression)isEven.Body;
        Console.WriteLine($"{binary.NodeType} of {binary.Left} and {binary.Right}");
        Console.WriteLine(isEven.Compile()(10));
    }
}
