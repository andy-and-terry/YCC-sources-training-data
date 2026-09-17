using System;

interface ICoffee
{
    string Description { get; }
    double Cost { get; }
}

class SimpleCoffee : ICoffee
{
    public string Description => "Coffee";
    public double Cost => 2.0;
}

abstract class CoffeeDecorator : ICoffee
{
    protected readonly ICoffee Inner;

    protected CoffeeDecorator(ICoffee inner) => Inner = inner;

    public virtual string Description => Inner.Description;
    public virtual double Cost => Inner.Cost;
}

class MilkDecorator : CoffeeDecorator
{
    public MilkDecorator(ICoffee inner) : base(inner)
    {
    }

    public override string Description => Inner.Description + " + milk";
    public override double Cost => Inner.Cost + 0.5;
}

class SugarDecorator : CoffeeDecorator
{
    public SugarDecorator(ICoffee inner) : base(inner)
    {
    }

    public override string Description => Inner.Description + " + sugar";
    public override double Cost => Inner.Cost + 0.25;
}

class DecoratorPatternDemo
{
    static void Main()
    {
        ICoffee coffee = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
        Console.WriteLine($"{coffee.Description}: {coffee.Cost}");
    }
}
