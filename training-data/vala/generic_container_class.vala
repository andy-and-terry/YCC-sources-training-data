class Box<T> : Object {
    public T value;
    public Box (T v) { value = v; }
}

void main () {
    var b = new Box<int> (7);
    var s = new Box<string> ("hi");
    print ("%d %s\n", b.value, s.value);
}
