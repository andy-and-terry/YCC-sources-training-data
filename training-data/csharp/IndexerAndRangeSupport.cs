using System;

class Matrix
{
    private readonly double[,] d;
    public Matrix(int r, int c) { d = new double[r, c]; }
    public double this[int r, int c] { get => d[r, c]; set => d[r, c] = value; }
}

class IndexerAndRangeSupport
{
    static void Main()
    {
        var m = new Matrix(2, 2);
        m[1, 1] = 4.5;
        Console.WriteLine(m[1, 1]);
        int[] a = { 10, 20, 30, 40, 50 };
        Console.WriteLine(a[^1] + " " + string.Join(",", a[1..3]) + " " + string.Join(",", a[..2]) + " " + string.Join(",", a[^2..]));
        string s = "hello world";
        Console.WriteLine(s[^5..] + s[..5].ToUpper());
    }
}
