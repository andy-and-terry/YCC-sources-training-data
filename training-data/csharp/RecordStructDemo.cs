using System;

readonly record struct Money(decimal Amount, string Currency)
{
    public Money Add(Money other)
    {
        if (Currency != other.Currency) throw new InvalidOperationException("currency mismatch");
        return this with { Amount = Amount + other.Amount };
    }
}

class RecordStructDemo
{
    static void Main()
    {
        var price = new Money(19.99m, "USD");
        var tax = new Money(1.60m, "USD");
        var total = price.Add(tax);

        Console.WriteLine(total);
        Console.WriteLine(price == new Money(19.99m, "USD"));
        Console.WriteLine(price.Equals(total));

        Money a = price;
        Money b = a;
        b = b with { Amount = 0 };
        Console.WriteLine($"a={a} b={b}");
    }
}
