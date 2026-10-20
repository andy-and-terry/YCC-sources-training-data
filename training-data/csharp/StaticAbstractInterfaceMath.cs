using System;

interface IAddable<T> where T : IAddable<T>
{
    static abstract T Zero { get; }
    static abstract T operator +(T a, T b);
}

readonly record struct Money(decimal V) : IAddable<Money>
{
    public static Money Zero => new(0);
    public static Money operator +(Money a, Money b) => new(a.V + b.V);
}

class StaticAbstractInterfaceMath
{
    static T Sum<T>(params T[] xs) where T : IAddable<T>
    {
        T acc = T.Zero;
        foreach (var x in xs) acc += x;
        return acc;
    }

    static void Main() => Console.WriteLine(Sum(new Money(1.5m), new Money(2.25m)));
}
