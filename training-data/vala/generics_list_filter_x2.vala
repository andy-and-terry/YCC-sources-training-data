void main () {
    var l = new Gee.ArrayList<int> ();
    for (int i = 1; i <= 6; i++) l.add (i);
    foreach (var x in l) if (x % 2 == 0) print ("%d ", x);
    print ("\n");
}
