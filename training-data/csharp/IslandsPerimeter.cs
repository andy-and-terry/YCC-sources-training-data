using System;

class IslandsPerimeter
{
    static int Perimeter(int[,] g)
    {
        int rows = g.GetLength(0), cols = g.GetLength(1), per = 0;
        int At(int r, int c) => r < 0 || c < 0 || r >= rows || c >= cols ? 0 : g[r, c];
        for (int r = 0; r < rows; r++)
            for (int c = 0; c < cols; c++)
                if (g[r, c] == 1) per += 4 - At(r - 1, c) - At(r + 1, c) - At(r, c - 1) - At(r, c + 1);
        return per;
    }

    static void Main() => Console.WriteLine(Perimeter(new[,] { { 0, 1, 0, 0 }, { 1, 1, 1, 0 }, { 0, 1, 0, 0 }, { 1, 1, 0, 0 } }));
}
