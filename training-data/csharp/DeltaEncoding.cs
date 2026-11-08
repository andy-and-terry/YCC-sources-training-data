using System;
using System.Linq;

class DeltaEncoding
{
    static int[] Encode(int[] xs) => xs.Select((x, i) => i == 0 ? x : x - xs[i - 1]).ToArray();

    static int[] Decode(int[] ds)
    {
        int acc = 0;
        return ds.Select(d => acc += d).ToArray();
    }

    static void Main()
    {
        var d = Encode(new[] { 10, 12, 15, 15, 20 });
        Console.WriteLine($"{string.Join(",", d)} {string.Join(",", Decode(d))}");
    }
}
