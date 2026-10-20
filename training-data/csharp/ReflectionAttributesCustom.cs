using System;
using System.Linq;
using System.Reflection;

[AttributeUsage(AttributeTargets.Property)]
class ColumnAttribute : Attribute { public string Name { get; } public ColumnAttribute(string n) => Name = n; }

class Row
{
    [Column("user_id")] public int Id { get; set; } = 7;
    [Column("full_name")] public string Name { get; set; } = "Ada";
    public string Ignored { get; set; } = "x";
}

class ReflectionAttributesCustom
{
    static void Main()
    {
        var r = new Row();
        foreach (var p in typeof(Row).GetProperties().Where(p => p.GetCustomAttribute<ColumnAttribute>() != null))
            Console.WriteLine($"{p.GetCustomAttribute<ColumnAttribute>()!.Name}={p.GetValue(r)}");
    }
}
