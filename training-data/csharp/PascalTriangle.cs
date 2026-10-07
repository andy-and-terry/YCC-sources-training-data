using System;
using System.Collections.Generic;

class PascalTriangle
{
    static List<long[]> Build(int rows)
    {
        var triangle = new List<long[]>();
        for (int i = 0; i < rows; i++)
        {
            var row = new long[i + 1];
            row[0] = row[i] = 1;
            for (int j = 1; j < i; j++)
                row[j] = triangle[i - 1][j - 1] + triangle[i - 1][j];
            triangle.Add(row);
        }
        return triangle;
    }

    static void Main()
    {
        foreach (var row in Build(6))
            Console.WriteLine(string.Join(" ", row));
    }
}
