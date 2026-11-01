interface Speaker : Object {
    public abstract string speak ();
    public virtual string shout () { return speak ().up () + "!"; }
}

class Dog : Object, Speaker {
    public string speak () { return "woof"; }
}

void main () {
    print ("%s\n", new Dog ().shout ());
}
