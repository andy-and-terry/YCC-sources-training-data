using System;
using System.Linq;

record Department(int Id, string Name);
record Employee(string Name, int DeptId, decimal Salary);

class LinqGroupJoinDemo
{
    static void Main()
    {
        var depts = new[] { new Department(1, "Eng"), new Department(2, "Ops"), new Department(3, "Legal") };
        var emps = new[]
        {
            new Employee("Ana", 1, 120m), new Employee("Bo", 1, 100m),
            new Employee("Cy", 2, 80m)
        };

        var grouped = depts.GroupJoin(emps, d => d.Id, e => e.DeptId,
            (d, es) => new { d.Name, Count = es.Count(), Total = es.Sum(e => e.Salary) });

        foreach (var g in grouped)
            Console.WriteLine($"{g.Name}: {g.Count} staff, payroll {g.Total}");

        var inner = from e in emps
                    join d in depts on e.DeptId equals d.Id
                    orderby e.Salary descending
                    select $"{e.Name} ({d.Name})";
        Console.WriteLine(string.Join(", ", inner));
    }
}
