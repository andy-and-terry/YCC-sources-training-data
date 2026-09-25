using System;
using System.Collections.Generic;

sealed class OpenHashSet<T> where T : notnull
{
    enum State : byte { Empty, Full, Deleted }

    State[] states = new State[8];
    T[] keys = new T[8];
    int used;

    public int Count { get; private set; }

    int Index(T key) => (key.GetHashCode() & int.MaxValue) % keys.Length;

    int Find(T key)
    {
        for (int i = Index(key), n = 0; n < keys.Length; i = (i + 1) % keys.Length, n++)
        {
            if (states[i] == State.Empty) return -1;
            if (states[i] == State.Full && EqualityComparer<T>.Default.Equals(keys[i], key)) return i;
        }
        return -1;
    }

    public bool Contains(T key) => Find(key) >= 0;

    public bool Add(T key)
    {
        if (Contains(key)) return false;
        if ((used + 1) * 2 > keys.Length) Rehash();
        int i = Index(key);
        while (states[i] == State.Full) i = (i + 1) % keys.Length;
        if (states[i] == State.Empty) used++;
        states[i] = State.Full;
        keys[i] = key;
        Count++;
        return true;
    }

    public bool Remove(T key)
    {
        int i = Find(key);
        if (i < 0) return false;
        states[i] = State.Deleted;
        keys[i] = default!;
        Count--;
        return true;
    }

    void Rehash()
    {
        var (oldStates, oldKeys) = (states, keys);
        states = new State[oldKeys.Length * 2];
        keys = new T[oldKeys.Length * 2];
        Count = used = 0;
        for (int i = 0; i < oldKeys.Length; i++)
            if (oldStates[i] == State.Full) Add(oldKeys[i]);
    }
}

class HashSetOpenAddressing
{
    static void Main()
    {
        var set = new OpenHashSet<string>();
        foreach (var w in "the quick brown fox jumps over the lazy dog".Split(' ')) set.Add(w);
        set.Remove("fox");
        Console.WriteLine($"{set.Count} {set.Contains("fox")} {set.Contains("dog")}");
    }
}
