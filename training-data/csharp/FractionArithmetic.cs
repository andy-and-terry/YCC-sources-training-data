using System;
using System.Linq;
using System.Numerics;

readonly struct Fraction : IComparable<Fraction>, IEquatable<Fraction>
{
    public BigInteger Num { get; }
    public BigInteger Den { get; }

    public Fraction(BigInteger num, BigInteger den)
    {
        if (den.IsZero) throw new DivideByZeroException("zero denominator");
        if (den.Sign < 0) (num, den) = (-num, -den);
        var g = BigInteger.GreatestCommonDivisor(num, den);
        if (!g.IsZero && !g.IsOne) (num, den) = (num / g, den / g);
        Num = num;
        Den = den;
    }

    public static Fraction operator +(Fraction a, Fraction b) => new(a.Num * b.Den + b.Num * a.Den, a.Den * b.Den);
    public static Fraction operator -(Fraction a, Fraction b) => new(a.Num * b.Den - b.Num * a.Den, a.Den * b.Den);
    public static Fraction operator *(Fraction a, Fraction b) => new(a.Num * b.Num, a.Den * b.Den);
    public static Fraction operator /(Fraction a, Fraction b) => new(a.Num * b.Den, a.Den * b.Num);
    public static bool operator >(Fraction a, Fraction b) => a.CompareTo(b) > 0;
    public static bool operator <(Fraction a, Fraction b) => a.CompareTo(b) < 0;
    public static implicit operator Fraction(int n) => new(n, 1);

    public int CompareTo(Fraction o) => (Num * o.Den).CompareTo(o.Num * Den);
    public bool Equals(Fraction o) => Num == o.Num && Den == o.Den;
    public override bool Equals(object? obj) => obj is Fraction f && Equals(f);
    public override int GetHashCode() => HashCode.Combine(Num, Den);
    public override string ToString() => Den.IsOne ? Num.ToString() : $"{Num}/{Den}";
}

class FractionArithmetic
{
    static void Main()
    {
        Fraction a = new(1, 3), b = new(1, 6);
        Console.WriteLine($"{a + b} {a - b} {a * b} {a / b} {a > b}");
        Fraction h = Enumerable.Range(1, 30).Aggregate((Fraction)0, (acc, k) => acc + new Fraction(1, k));
        Console.WriteLine($"H(30) = {h}");
    }
}
