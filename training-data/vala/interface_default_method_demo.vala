interface Greeter : Object {
    public abstract string name();

    public virtual string greeting() {
        return "Hello, %s!".printf(name());
    }
}

class Person : Object, Greeter {
    private string _name;

    public Person(string name) {
        _name = name;
    }

    public string name() {
        return _name;
    }
}

class Robot : Object, Greeter {
    public string name() {
        return "Unit-7";
    }

    public override string greeting() {
        return "BEEP BOOP, I AM %s".printf(name());
    }
}

void main() {
    Greeter[] greeters = { new Person("Ada"), new Robot() };
    foreach (Greeter g in greeters) {
        stdout.printf("%s\n", g.greeting());
    }
}
