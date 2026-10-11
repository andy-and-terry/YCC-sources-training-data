using System;

class SealedAbstractOverrideDemo
{
    abstract class Animal
    {
        public string Name { get; }
        protected Animal(string name) => Name = name;
        public abstract string Sound();
        public virtual string Describe() => $"{Name} says {Sound()}";
    }

    class Dog : Animal
    {
        public Dog(string n) : base(n) { }
        public override string Sound() => "Woof";
    }

    sealed class Puppy : Dog
    {
        public Puppy(string n) : base(n) { }
        public override string Sound() => "Yip";
        public sealed override string Describe() => base.Describe() + " (squeaky)";
    }

    class Cat : Animal
    {
        public Cat(string n) : base(n) { }
        public override string Sound() => "Meow";
        public new string Describe() => "hidden by new";
    }

    static void Main()
    {
        Animal[] zoo = { new Dog("Rex"), new Puppy("Bit"), new Cat("Tom") };
        foreach (var a in zoo) Console.WriteLine(a.Describe());
        Console.WriteLine(((Cat)zoo[2]).Describe());
    }
}
