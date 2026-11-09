void main () {
    var list = new Gee.ArrayList<int> ();
    for (int i = 1; i <= 5; i++) list.add (i);
    list.foreach ((x) => { print ("%d ", x * x); return true; });
    print ("\n");
}
