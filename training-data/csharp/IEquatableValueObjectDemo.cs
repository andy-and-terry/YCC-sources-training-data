using System;
using System.Collections.Generic;

sealed class Money : IEquatable<Money>
{
    public decimal Amount { get; }
    public string Currency { get; }

    public Money(decimal amount, string currency)
    {
        Amount = amount;
        Currency = currency;
    }

    public bool Equals(Money? other) =>
        other is not null && Amount == other.Amount && Currency == other.Currency;

    public override bool Equals(object? obj) => Equals(obj as Money);
    public override int GetHashCode() => HashCode.Combine(Amount, Currency);
    public static bool operator ==(Money? a, Money? b) => Equals(a, b);
    public static bool operator !=(Money? a, Money? b) => !Equals(a, b);
}

class IEquatableValueObjectDemo
{
    static void Main()
    {
        var a = new Money(5m, "USD");
        var b = new Money(5m, "USD");
        Console.WriteLine(a == b);
        Console.WriteLine(ReferenceEquals(a, b));

        var set = new HashSet<Money> { a };
        Console.WriteLine(set.Contains(b));
    }
}
