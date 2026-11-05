interface Speaker : Object {
    public abstract string speak ();
}

class Dog : Object, Speaker {
    public string speak () { return "woof"; }
}

void main () {
    Speaker s = new Dog ();
    print ("%s\n", s.speak ());
}
