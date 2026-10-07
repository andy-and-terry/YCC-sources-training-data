using System;
using System.Collections.Generic;

class Animal
{
    public string Name = "animal";
}

class Dog : Animal
{
    public Dog() => Name = "dog";
}

class CovarianceContravarianceDemo
{
    static void PrintNames(IEnumerable<Animal> animals)
    {
        foreach (var a in animals) Console.WriteLine(a.Name);
    }

    static void HandleDog(Action<Dog> handler)
    {
        handler(new Dog());
    }

    static void Main()
    {
        List<Dog> dogs = new() { new Dog(), new Dog() };
        PrintNames(dogs);

        Action<Animal> logAnimal = animal => Console.WriteLine($"logging {animal.Name}");
        HandleDog(logAnimal);
    }
}
