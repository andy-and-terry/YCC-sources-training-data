using System;
using System.Linq;

class LinqGroupJoinAggregate
{
    record Emp(string Name, string Dept, int Pay);
    record Dept(string Id, string Title);

    static void Main()
    {
        var emps = new[] { new Emp("a", "e", 10), new Emp("b", "e", 20), new Emp("c", "o", 5) };
        var depts = new[] { new Dept("e", "Eng"), new Dept("o", "Ops") };
        foreach (var g in emps.GroupBy(e => e.Dept).Select(g => new { g.Key, Total = g.Sum(e => e.Pay), Avg = g.Average(e => e.Pay) }))
            Console.WriteLine($"{g.Key} {g.Total} {g.Avg}");
        var joined = emps.Join(depts, e => e.Dept, d => d.Id, (e, d) => $"{e.Name}@{d.Title}");
        Console.WriteLine(string.Join(",", joined));
        Console.WriteLine(emps.Max(e => e.Pay) + " " + emps.OrderByDescending(e => e.Pay).First().Name);
        Console.WriteLine(emps.Aggregate(0, (acc, e) => acc + e.Pay));
    }
}
