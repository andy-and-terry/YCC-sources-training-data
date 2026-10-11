class Pair<A, B> {
    public A first { get; private set; }
    public B second { get; private set; }

    public Pair (A first, B second) {
        this.first = first;
        this.second = second;
    }

    public Pair<B, A> swap () {
        return new Pair<B, A> (second, first);
    }
}

void main () {
    var p = new Pair<string, int> ("age", 42);
    var q = p.swap ();
    stdout.printf ("%s=%d\n", p.first, p.second);
    stdout.printf ("%d=%s\n", q.first, q.second);
}
