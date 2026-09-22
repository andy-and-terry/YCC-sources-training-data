using System;

class Coordinates
{
    public double Latitude { get; init; }
    public double Longitude { get; init; }

    public override string ToString() => $"({Latitude}, {Longitude})";
}

class InitOnlyPropertiesDemo
{
    static void Main()
    {
        var origin = new Coordinates { Latitude = 0, Longitude = 0 };
        var sf = new Coordinates { Latitude = 37.7749, Longitude = -122.4194 };

        Console.WriteLine(origin);
        Console.WriteLine(sf);

        // origin.Latitude = 1; // compile error: init-only property can only be set in an object initializer
    }
}
