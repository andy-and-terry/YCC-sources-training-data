class Person : Object {
    private int _age;
    public string name { get; construct set; }
    public int age {
        get { return _age; }
        set { _age = value < 0 ? 0 : value; }
    }
    public string label { owned get { return "%s (%d)".printf (name, age); } }
    public string? nickname { get; set; default = null; }

    construct { if (name == null) name = "anon"; }
    public Person (string n, int a) { Object (name: n); age = a; }
}

void main () {
    var p = new Person ("Ada", 36);
    p.age = -5;
    print ("%s %s\n", p.label, p.nickname ?? "no nickname");
    p.notify["age"].connect ((s, spec) => print ("age changed\n"));
    p.age = 40;
    print ("%s\n", p.label);
}
