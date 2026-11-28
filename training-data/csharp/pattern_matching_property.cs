using System;

Console.WriteLine(Describe(new Order(5, "gold")));
Console.WriteLine(Describe(new Order(0, "none")));

static string Describe(Order o) => o switch
{
    { Qty: 0 } => "empty",
    { Tier: "gold", Qty: > 3 } => "bulk gold",
    { Qty: var q } => $"{q} items",
};

record Order(int Qty, string Tier);
