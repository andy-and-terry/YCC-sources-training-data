using System;
using System.Collections.Generic;

abstract class Animal
{
    public abstract string Speak();
}

class Dog : Animal
{
    public override string Speak() => "Woof";
}

class Cat : Animal
{
    public override string Speak() => "Meow";
}

class AbstractClassPolymorphism
{
    static void Main()
    {
        var animals = new List<Animal> { new Dog(), new Cat() };
        foreach (var a in animals) Console.WriteLine(a.Speak());
    }
}
