using System;

class RollingHash
{
    static void Main()
    {
        string s = "abcabc"; int k = 3; long B = 31, M = 1000003, pw = 1, h = 0;
        for (int i = 1; i < k; i++) pw = pw * B % M;
        for (int i = 0; i < k; i++) h = (h * B + s[i]) % M;
        Console.WriteLine($"0 {h}");
        for (int i = 1; i + k <= s.Length; i++)
        {
            h = (h - s[i - 1] * pw % M + M) % M;
            h = (h * B + s[i + k - 1]) % M;
            Console.WriteLine($"{i} {h}");
        }
    }
}
