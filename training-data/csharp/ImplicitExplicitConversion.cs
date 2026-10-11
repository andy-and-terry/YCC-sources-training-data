using System;

class ImplicitExplicitConversion
{
    readonly struct Meters
    {
        public double Value { get; }
        public Meters(double v) => Value = v;
        public static implicit operator Meters(double d) => new(d);
        public static explicit operator double(Meters m) => m.Value;
        public override string ToString() => $"{Value}m";
    }

    readonly struct Percent
    {
        private readonly int _v;
        private Percent(int v) => _v = v;
        public static explicit operator Percent(int v) =>
            v is >= 0 and <= 100 ? new Percent(v) : throw new ArgumentOutOfRangeException(nameof(v));
        public override string ToString() => _v + "%";
    }

    static void Main()
    {
        Meters m = 12.5;
        double raw = (double)m;
        Console.WriteLine($"{m} {raw}");
        Console.WriteLine((Percent)80);
        try { Console.WriteLine((Percent)150); }
        catch (ArgumentOutOfRangeException) { Console.WriteLine("out of range"); }
        long big = int.MaxValue;
        Console.WriteLine(unchecked((int)(big + 1)));
    }
}
