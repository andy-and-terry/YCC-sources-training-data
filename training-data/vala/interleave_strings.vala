string interleave (string[] parts) {
    int longest = 0;
    foreach (var p in parts) longest = int.max (longest, p.length);
    var sb = new StringBuilder ();
    for (int i = 0; i < longest; i++)
        foreach (var p in parts)
            if (i < p.length) sb.append_c (p[i]);
    return sb.str;
}

void main () {
    print ("%s\n", interleave ({ "abc", "12345" }));
    print ("%s\n", interleave ({ "ab", "cd", "efg" }));
}
