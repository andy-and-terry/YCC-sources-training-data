class Box<T> : Object {
    public T value;
    public Box (T v) { value = v; }
    public T get () { return value; }
}

void main () {
    var a = new Box<int> (7);
    var b = new Box<string> ("hi");
    print ("%d %s\n", a.get (), b.get ());
}
