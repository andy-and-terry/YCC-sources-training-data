interface Named : Object {
    public abstract string name { get; }
    public string hello () { return "Hi " + name; }
}

class P : Object, Named {
    public string name { get { return "Vala"; } }
}

void main () { print ("%s\n", new P ().hello ()); }
