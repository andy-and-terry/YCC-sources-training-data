using System;
using System.Collections.Generic;

class InsertInterval
{
    static List<(int Lo, int Hi)> Insert(List<(int Lo, int Hi)> iv, (int Lo, int Hi) n)
    {
        var result = new List<(int Lo, int Hi)>();
        int i = 0;
        while (i < iv.Count && iv[i].Hi < n.Lo) result.Add(iv[i++]);
        while (i < iv.Count && iv[i].Lo <= n.Hi)
        {
            n = (Math.Min(n.Lo, iv[i].Lo), Math.Max(n.Hi, iv[i].Hi));
            i++;
        }
        result.Add(n);
        while (i < iv.Count) result.Add(iv[i++]);
        return result;
    }

    static void Main()
    {
        var r = Insert(new() { (1, 3), (6, 9) }, (2, 5));
        Console.WriteLine(string.Join(" ", r)); // (1, 5) (6, 9)
    }
}
