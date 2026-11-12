using System;
class Order { public decimal Total; public bool Vip; }
class Program {
    static decimal Discount(Order o) => o switch {
        { Vip: true, Total: > 100 } => 0.20m,
        { Vip: true } => 0.10m,
        { Total: > 100 } => 0.05m,
        _ => 0m
    };
    static void Main() {
        Console.WriteLine(Discount(new Order { Total = 150, Vip = true }));
        Console.WriteLine(Discount(new Order { Total = 20 }));
    }
}
