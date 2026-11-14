using System;
using System.Numerics;

Console.WriteLine(Sum(new[] { 1, 2, 3 }));
Console.WriteLine(Sum(new[] { 1.5, 2.5 }));

static T Sum<T>(T[] xs) where T : INumber<T>
{
    T t = T.Zero;
    foreach (var x in xs) t += x;
    return t;
}
