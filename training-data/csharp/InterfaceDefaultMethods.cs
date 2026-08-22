using System;

interface IGreeter
{
    string Name();
    string Greeting() => $"Hello, {Name()}!";
}

class PersonGreeter : IGreeter
{
    private readonly string name;
    public PersonGreeter(string name) => this.name = name;
    public string Name() => name;
}

class RobotGreeter : IGreeter
{
    public string Name() => "Robot";
    public string Greeting() => $"BEEP BOOP {Name().ToUpper()}";
}

class InterfaceDefaultMethods
{
    static void Main()
    {
        IGreeter p = new PersonGreeter("Alice");
        IGreeter r = new RobotGreeter();
        Console.WriteLine(p.Greeting());
        Console.WriteLine(r.Greeting());
    }
}
