using System;
using System.Collections.Generic;
using System.Linq;

sealed record Product(string Sku, string Name, decimal Price, int ReorderLevel)
{
    public int Quantity { get; set; }
}

sealed class Inventory
{
    readonly Dictionary<string, Product> products = new();

    public void Add(Product p) => products.Add(p.Sku, p);

    Product Get(string sku) => products.TryGetValue(sku, out var p) ? p : throw new KeyNotFoundException($"unknown sku {sku}");

    public void Receive(string sku, int qty) => Get(sku).Quantity += qty;

    public decimal Sell(string sku, int qty)
    {
        var p = Get(sku);
        if (p.Quantity < qty) throw new InvalidOperationException($"{p.Name}: have {p.Quantity}, want {qty}");
        p.Quantity -= qty;
        return qty * p.Price;
    }

    public IEnumerable<string> ReorderList() => products.Values.Where(p => p.Quantity <= p.ReorderLevel).Select(p => p.Name);
    public decimal Valuation => products.Values.Sum(p => p.Quantity * p.Price);
}

class InventorySystem
{
    static void Main()
    {
        var inv = new Inventory();
        inv.Add(new Product("A1", "apple", 0.50m, 10));
        inv.Add(new Product("P1", "pear", 0.75m, 5));
        inv.Receive("A1", 40);
        inv.Receive("P1", 8);
        decimal revenue = inv.Sell("A1", 32) + inv.Sell("P1", 2);
        try
        {
            inv.Sell("P1", 100);
        }
        catch (InvalidOperationException e)
        {
            Console.WriteLine($"error: {e.Message}");
        }
        Console.WriteLine($"revenue {revenue:F2}, stock value {inv.Valuation:F2}, reorder: {string.Join(",", inv.ReorderList())}");
    }
}
