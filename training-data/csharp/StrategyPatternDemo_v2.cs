using System;
using System.Collections.Generic;
using System.Linq;

interface ISortStrategy
{
    List<int> Sort(List<int> data);
}

class AscendingStrategy : ISortStrategy
{
    public List<int> Sort(List<int> data) => data.OrderBy(x => x).ToList();
}

class DescendingStrategy : ISortStrategy
{
    public List<int> Sort(List<int> data) => data.OrderByDescending(x => x).ToList();
}

class Sorter
{
    private ISortStrategy strategy;
    public Sorter(ISortStrategy strategy) => this.strategy = strategy;
    public void SetStrategy(ISortStrategy strategy) => this.strategy = strategy;
    public List<int> Execute(List<int> data) => strategy.Sort(data);
}

class StrategyPatternDemo
{
    static void Main()
    {
        var data = new List<int> { 5, 2, 8, 1, 9 };
        var sorter = new Sorter(new AscendingStrategy());
        Console.WriteLine(string.Join(",", sorter.Execute(data)));

        sorter.SetStrategy(new DescendingStrategy());
        Console.WriteLine(string.Join(",", sorter.Execute(data)));
    }
}
