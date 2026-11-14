void main () {
    var l = new Gee.ArrayList<int> ();
    l.add (3); l.add (1); l.add (2);
    l.sort ();
    foreach (var x in l) print ("%d ", x);
    print ("\n");
}
