void main () {
    string s = "banana$";
    int n = s.length;
    string[] rots = new string[n];
    for (int i = 0; i < n; i++) rots[i] = s.substring (i) + s.substring (0, i);
    qsort_with_data<string> (rots, sizeof (string), (a, b) => strcmp (a, b));
    var sb = new StringBuilder ();
    foreach (var r in rots) sb.append_c (r[n - 1]);
    print ("%s\n", sb.str);
}
