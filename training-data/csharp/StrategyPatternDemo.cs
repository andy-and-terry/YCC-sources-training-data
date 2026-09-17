using System;
using System.Collections.Generic;

interface ISortStrategy
{
    void Sort(List<int> data);
}

class AscendingSortStrategy : ISortStrategy
{
    public void Sort(List<int> data) => data.Sort();
}

class DescendingSortStrategy : ISortStrategy
{
    public void Sort(List<int> data) => data.Sort((a, b) => b.CompareTo(a));
}

class Sorter
{
    private ISortStrategy strategy;

    public Sorter(ISortStrategy strategy) => this.strategy = strategy;

    public void SetStrategy(ISortStrategy strategy) => this.strategy = strategy;

    public void Sort(List<int> data) => strategy.Sort(data);
}

class StrategyPatternDemo
{
    static void Main()
    {
        var data = new List<int> { 5, 3, 8, 1, 9 };
        var sorter = new Sorter(new AscendingSortStrategy());
        sorter.Sort(data);
        Console.WriteLine(string.Join(", ", data));

        sorter.SetStrategy(new DescendingSortStrategy());
        sorter.Sort(data);
        Console.WriteLine(string.Join(", ", data));
    }
}
