using Gee;

void main () {
    var list = new ArrayList<string> ();
    list.add ("b"); list.add ("a");
    list.sort ((x, y) => strcmp (x, y));
    foreach (var s in list) print ("%s ", s);
    var map = new HashMap<string, int> ();
    map["x"] = 1;
    print ("\n%d\n", map["x"]);
}
