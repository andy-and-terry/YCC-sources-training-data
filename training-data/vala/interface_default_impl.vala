interface Greeter : Object {
    public abstract string name { get; }
    public string greet () { return "Hello, " + name; }
}

class P : Object, Greeter {
    public string name { get { return "Ann"; } }
}

void main () { print ("%s\n", new P ().greet ()); }
