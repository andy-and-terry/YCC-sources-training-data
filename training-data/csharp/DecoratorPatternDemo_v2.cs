using System;

interface ICoffee
{
    string Describe();
    double Cost();
}

class SimpleCoffee : ICoffee
{
    public string Describe() => "coffee";
    public double Cost() => 2.0;
}

abstract class CoffeeDecorator : ICoffee
{
    protected readonly ICoffee Inner;
    protected CoffeeDecorator(ICoffee inner) => Inner = inner;
    public virtual string Describe() => Inner.Describe();
    public virtual double Cost() => Inner.Cost();
}

class MilkDecorator : CoffeeDecorator
{
    public MilkDecorator(ICoffee inner) : base(inner) { }
    public override string Describe() => $"{Inner.Describe()} + milk";
    public override double Cost() => Inner.Cost() + 0.5;
}

class SugarDecorator : CoffeeDecorator
{
    public SugarDecorator(ICoffee inner) : base(inner) { }
    public override string Describe() => $"{Inner.Describe()} + sugar";
    public override double Cost() => Inner.Cost() + 0.25;
}

class DecoratorPatternDemo
{
    static void Main()
    {
        ICoffee order = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
        Console.WriteLine($"{order.Describe()} = {order.Cost()}");
    }
}
