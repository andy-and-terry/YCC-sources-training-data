using System;
using System.Security.Cryptography;
using System.Text;

class BloomFilter
{
    private readonly bool[] bits;
    private readonly int size;
    private readonly int numHashes;

    public BloomFilter(int size, int numHashes)
    {
        this.size = size;
        this.numHashes = numHashes;
        bits = new bool[size];
    }

    private int[] Hashes(string item)
    {
        var result = new int[numHashes];
        using var sha256 = SHA256.Create();
        for (int i = 0; i < numHashes; i++)
        {
            var hash = sha256.ComputeHash(Encoding.UTF8.GetBytes($"{i}:{item}"));
            int value = BitConverter.ToInt32(hash, 0) & int.MaxValue;
            result[i] = value % size;
        }
        return result;
    }

    public void Add(string item)
    {
        foreach (int idx in Hashes(item)) bits[idx] = true;
    }

    public bool MightContain(string item)
    {
        foreach (int idx in Hashes(item)) if (!bits[idx]) return false;
        return true;
    }

    static void Main()
    {
        var bf = new BloomFilter(1000, 3);
        bf.Add("hello");
        Console.WriteLine($"{bf.MightContain("hello")} {bf.MightContain("world")}");
    }
}
