using System;

class SimpleHashFunctionDemo
{
    static uint Djb2Hash(string s)
    {
        uint h = 5381;
        foreach (char c in s) h = ((h << 5) + h) + c;
        return h;
    }

    static uint Fnv1aHash(string s)
    {
        uint h = 0x811c9dc5;
        foreach (char c in s)
        {
            h ^= c;
            h *= 0x01000193;
        }
        return h;
    }

    static void Main()
    {
        Console.WriteLine($"{Djb2Hash("hello")} {Fnv1aHash("hello")}");
    }
}
