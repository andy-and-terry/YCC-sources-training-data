class MinStack : Object {
    private Gee.ArrayList<int> vals = new Gee.ArrayList<int> ();
    private Gee.ArrayList<int> mins = new Gee.ArrayList<int> ();

    public void push (int x) {
        mins.add (mins.size > 0 ? int.min (x, mins.last ()) : x);
        vals.add (x);
    }

    public int pop () {
        mins.remove_at (mins.size - 1);
        return vals.remove_at (vals.size - 1);
    }

    public int minimum () { return mins.last (); }
}

void main () {
    var s = new MinStack ();
    foreach (int v in new int[] { 5, 3, 7, 2 }) s.push (v);
    print ("%d\n", s.minimum ());
    s.pop ();
    print ("%d\n", s.minimum ());
}
