using System;
using System.Collections.Generic;
using System.Linq;

record Employee(string Name, string Department, double Salary);

class LinqQueries
{
    static void Main()
    {
        var employees = new List<Employee>
        {
            new("Alice", "Engineering", 95000),
            new("Bob", "Sales", 65000),
            new("Carol", "Engineering", 105000),
            new("Dave", "Sales", 70000),
        };

        var avgByDept = employees
            .GroupBy(e => e.Department)
            .Select(g => new { Department = g.Key, Avg = g.Average(e => e.Salary) });
        foreach (var x in avgByDept) Console.WriteLine($"{x.Department}: {x.Avg}");

        var highEarners = employees
            .Where(e => e.Salary > 80000)
            .Select(e => e.Name)
            .OrderBy(n => n)
            .ToList();
        Console.WriteLine(string.Join(", ", highEarners));

        double totalPayroll = employees.Sum(e => e.Salary);
        Console.WriteLine(totalPayroll);
    }
}
