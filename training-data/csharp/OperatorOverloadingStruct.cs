using System;

readonly struct Complex
{
    public readonly double Re, Im;
    public Complex(double re, double im) { Re = re; Im = im; }
    public static Complex operator +(Complex a, Complex b) => new(a.Re + b.Re, a.Im + b.Im);
    public static Complex operator *(Complex a, Complex b) => new(a.Re * b.Re - a.Im * b.Im, a.Re * b.Im + a.Im * b.Re);
    public static bool operator ==(Complex a, Complex b) => a.Re == b.Re && a.Im == b.Im;
    public static bool operator !=(Complex a, Complex b) => !(a == b);
    public static implicit operator Complex(double d) => new(d, 0);
    public override bool Equals(object? o) => o is Complex c && this == c;
    public override int GetHashCode() => HashCode.Combine(Re, Im);
    public override string ToString() => $"{Re}+{Im}i";
}

class OperatorOverloadingStruct
{
    static void Main()
    {
        var i = new Complex(0, 1);
        Console.WriteLine(i * i + 2.0);
        Console.WriteLine(i == new Complex(0, 1));
    }
}
