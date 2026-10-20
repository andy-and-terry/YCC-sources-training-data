class Stack<T> {
    private GLib.List<T> items = new GLib.List<T> ();
    public void push (T item) { items.prepend (item); }
    public T? pop () {
        if (items.length () == 0) return null;
        T top = items.nth_data (0);
        items.remove (top);
        return top;
    }
    public uint size { get { return items.length (); } }
}

T max_of<T> (T[] xs, CompareFunc<T> cmp) {
    T best = xs[0];
    foreach (var x in xs) if (cmp (x, best) > 0) best = x;
    return best;
}

void main () {
    var s = new Stack<string> ();
    s.push ("a"); s.push ("b");
    print ("%s %u\n", s.pop (), s.size);
    print ("%d\n", max_of<int> ({3, 9, 4}, (a, b) => a - b));
    var map = new HashTable<string, int> (str_hash, str_equal);
    map["x"] = 1; map["y"] = 2;
    print ("%d %u\n", map["y"], map.size ());
    var arr = new Array<int> ();
    arr.append_val (5); arr.append_val (7);
    print ("%d %u\n", arr.index (1), arr.length);
}
