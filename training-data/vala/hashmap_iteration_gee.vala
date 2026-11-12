void main () {
    var m = new Gee.HashMap<string, int> ();
    m["a"] = 1; m["b"] = 2;
    foreach (var e in m.entries) print ("%s=%d\n", e.key, e.value);
}
