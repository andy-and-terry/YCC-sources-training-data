using System;
using System.Collections.Generic;

class Pizza
{
    public List<string> Toppings = new();
    public string Size = "medium";
}

class PizzaBuilder
{
    private readonly Pizza pizza = new();

    public PizzaBuilder WithSize(string size)
    {
        pizza.Size = size;
        return this;
    }

    public PizzaBuilder AddTopping(string topping)
    {
        pizza.Toppings.Add(topping);
        return this;
    }

    public Pizza Build() => pizza;

    static void Main()
    {
        var pizza = new PizzaBuilder().WithSize("large").AddTopping("cheese").AddTopping("olives").Build();
        Console.WriteLine($"{pizza.Size}: {string.Join(", ", pizza.Toppings)}");
    }
}
