using System;
using System.Linq;

class LinqGroupJoin {
    record Dept(int Id, string Name);
    record Emp(string Name, int DeptId);

    static void Main() {
        var depts = new[] { new Dept(1, "Eng"), new Dept(2, "Ops") };
        var emps = new[] { new Emp("a", 1), new Emp("b", 1), new Emp("c", 2) };
        var q = depts.GroupJoin(emps, d => d.Id, e => e.DeptId, (d, es) => $"{d.Name}: {string.Join(",", es.Select(e => e.Name))}");
        foreach (var s in q) Console.WriteLine(s);
    }
}
