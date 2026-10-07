using System;
using System.Linq;

record Dept(int Id, string Name);
record Emp(string Name, int DeptId);

class LinqGroupJoinDemo
{
    static void Main()
    {
        var depts = new[] { new Dept(1, "Eng"), new Dept(2, "Ops"), new Dept(3, "HR") };
        var emps = new[] { new Emp("Ann", 1), new Emp("Bob", 1), new Emp("Cy", 2) };

        var grouped = depts.GroupJoin(emps, d => d.Id, e => e.DeptId,
            (d, es) => new { d.Name, Staff = es.Select(e => e.Name).ToList() });
        foreach (var g in grouped)
            Console.WriteLine($"{g.Name}: {(g.Staff.Count == 0 ? "-" : string.Join(",", g.Staff))}");

        var inner = from e in emps
                    join d in depts on e.DeptId equals d.Id
                    select $"{e.Name}@{d.Name}";
        Console.WriteLine(string.Join(" ", inner));
    }
}
