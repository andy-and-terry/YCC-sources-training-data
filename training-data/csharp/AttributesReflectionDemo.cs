using System;
using System.Reflection;

[AttributeUsage(AttributeTargets.Property)]
class DisplayNameAttribute : Attribute
{
    public string Name { get; }
    public DisplayNameAttribute(string name) => Name = name;
}

class Product
{
    [DisplayName("Product Title")]
    public string Title { get; set; } = "";

    [DisplayName("Unit Price")]
    public double Price { get; set; }
}

class AttributesReflectionDemo
{
    static void Main()
    {
        foreach (PropertyInfo prop in typeof(Product).GetProperties())
        {
            var attr = prop.GetCustomAttribute<DisplayNameAttribute>();
            if (attr != null) Console.WriteLine($"{prop.Name} -> {attr.Name}");
        }
    }
}
