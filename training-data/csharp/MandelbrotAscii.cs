using System;
using System.Numerics;

class MandelbrotAscii
{
    static void Main()
    {
        for (double y = -1.0; y <= 1.0; y += 0.2)
        {
            for (double x = -2.0; x <= 0.6; x += 0.05)
            {
                Complex z = Complex.Zero, c = new(x, y);
                int n = 0;
                while (n < 30 && z.Magnitude < 2) { z = z * z + c; n++; }
                Console.Write(n == 30 ? '#' : '.');
            }
            Console.WriteLine();
        }
    }
}
