using System;
using System.Collections.Generic;

class Enemy : ICloneable
{
    public string Type { get; set; }
    public int Health { get; set; }
    public List<string> Abilities { get; set; }

    public Enemy(string type, int health, List<string> abilities)
    {
        Type = type;
        Health = health;
        Abilities = abilities;
    }

    public object Clone()
    {
        return new Enemy(Type, Health, new List<string>(Abilities));
    }

    public override string ToString() => $"{Type} (hp={Health}, abilities=[{string.Join(", ", Abilities)}])";
}

class PrototypePatternDemo
{
    static void Main()
    {
        var template = new Enemy("Orc", 100, new List<string> { "slash", "roar" });

        var clone1 = (Enemy)template.Clone();
        clone1.Health = 80;

        var clone2 = (Enemy)template.Clone();
        clone2.Abilities.Add("charge");

        Console.WriteLine(template);
        Console.WriteLine(clone1);
        Console.WriteLine(clone2);
    }
}
