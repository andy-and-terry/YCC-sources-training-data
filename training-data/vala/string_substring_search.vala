void main () {
    string s = "find the needle in the haystack";
    stdout.printf ("index_of needle: %d\n", s.index_of ("needle"));
    stdout.printf ("last 'the': %d\n", s.last_index_of ("the"));
    stdout.printf ("index_of missing: %d\n", s.index_of ("xyz"));
    stdout.printf ("substring: %s\n", s.substring (9, 6));
    stdout.printf ("tail: %s\n", s.substring (s.index_of ("in")));
    stdout.printf ("contains: %s\n", s.contains ("hay").to_string ());

    int count = 0;
    int pos = 0;
    while ((pos = s.index_of ("the", pos)) >= 0) {
        count++;
        pos += 3;
    }
    stdout.printf ("occurrences of 'the': %d\n", count);
}
