using System;

struct Fraction
{
    public int Numerator;
    public int Denominator;

    public Fraction(int numerator, int denominator)
    {
        Numerator = numerator;
        Denominator = denominator;
    }

    public static Fraction operator +(Fraction a, Fraction b) =>
        new Fraction(a.Numerator * b.Denominator + b.Numerator * a.Denominator, a.Denominator * b.Denominator);

    public static Fraction operator *(Fraction a, Fraction b) =>
        new Fraction(a.Numerator * b.Numerator, a.Denominator * b.Denominator);

    public static bool operator ==(Fraction a, Fraction b) =>
        a.Numerator * b.Denominator == b.Numerator * a.Denominator;

    public static bool operator !=(Fraction a, Fraction b) => !(a == b);

    public override bool Equals(object obj) => obj is Fraction f && this == f;

    public override int GetHashCode() => HashCode.Combine(Numerator, Denominator);

    public override string ToString() => $"{Numerator}/{Denominator}";
}

class OperatorOverloadingDemo
{
    static void Main()
    {
        var half = new Fraction(1, 2);
        var third = new Fraction(1, 3);

        Console.WriteLine(half + third);
        Console.WriteLine(half * third);
        Console.WriteLine(half == new Fraction(2, 4));
    }
}
