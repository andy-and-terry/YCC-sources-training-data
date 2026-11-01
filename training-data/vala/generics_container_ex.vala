class Box<T> : Object {
    private T item;
    public Box (T i) { item = i; }
    public T get () { return item; }
}

void main () {
    var b = new Box<string> ("hello");
    var n = new Box<int> (42);
    print ("%s %d\n", b.get (), n.get ());
}
