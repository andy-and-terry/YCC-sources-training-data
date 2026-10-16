void main () {
    var q = new Queue<string> ();
    q.push_tail ("first");
    q.push_tail ("second");
    q.push_head ("urgent");

    stdout.printf ("length: %u\n", q.get_length ());
    stdout.printf ("peek: %s\n", q.peek_head ());
    while (!q.is_empty ()) {
        stdout.printf ("pop: %s\n", q.pop_head ());
    }
}
