using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

class SafeCache
{
    private readonly Dictionary<string, int> data = new();
    private readonly ReaderWriterLockSlim rw = new();

    public bool TryGet(string key, out int value)
    {
        rw.EnterReadLock();
        try { return data.TryGetValue(key, out value); }
        finally { rw.ExitReadLock(); }
    }

    public void Set(string key, int value)
    {
        rw.EnterWriteLock();
        try { data[key] = value; }
        finally { rw.ExitWriteLock(); }
    }
}

class ReaderWriterLockSlimDemo
{
    static void Main()
    {
        var cache = new SafeCache();
        Parallel.For(0, 100, i => cache.Set("k" + i % 10, i));
        Console.WriteLine(cache.TryGet("k3", out var v));
        Console.WriteLine(cache.TryGet("missing", out _));
    }
}
