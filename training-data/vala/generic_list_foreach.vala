void main () {
    var list = new Gee.ArrayList<string> ();
    list.add ("a"); list.add ("b");
    foreach (var s in list) print ("%s\n", s);
}
