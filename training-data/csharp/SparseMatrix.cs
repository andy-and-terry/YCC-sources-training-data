using System;
using System.Collections.Generic;
using System.Linq;

sealed class SparseMatrix
{
    readonly Dictionary<(int R, int C), double> data = new();
    public int Rows { get; }
    public int Cols { get; }

    public SparseMatrix(int rows, int cols) => (Rows, Cols) = (rows, cols);

    public double this[int r, int c]
    {
        get => data.GetValueOrDefault((r, c));
        set
        {
            if (value == 0) data.Remove((r, c));
            else data[(r, c)] = value;
        }
    }

    public int NonZeros => data.Count;

    public static SparseMatrix operator *(SparseMatrix a, SparseMatrix b)
    {
        var byRow = b.data.GroupBy(kv => kv.Key.R).ToDictionary(g => g.Key, g => g.ToList());
        var result = new SparseMatrix(a.Rows, b.Cols);
        foreach (var ((r, k), v) in a.data)
            if (byRow.TryGetValue(k, out var row))
                foreach (var ((_, c), w) in row) result[r, c] += v * w;
        return result;
    }

    public override string ToString() =>
        string.Join("\n", Enumerable.Range(0, Rows).Select(r => string.Join("\t", Enumerable.Range(0, Cols).Select(c => this[r, c]))));
}

class SparseMatrixDemo
{
    static void Main()
    {
        var a = new SparseMatrix(3, 3) { [0, 0] = 1, [1, 2] = 2, [2, 1] = 3 };
        var b = new SparseMatrix(3, 3) { [0, 1] = 4, [1, 0] = 5, [2, 2] = 6 };
        var p = a * b;
        Console.WriteLine(p);
        Console.WriteLine($"nnz = {p.NonZeros}");
    }
}
