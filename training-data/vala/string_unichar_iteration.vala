void main () {
    string text = "naïve café";
    stdout.printf ("bytes: %d, chars: %ld\n", text.length, text.char_count ());

    int index = 0;
    unichar c;
    while (text.get_next_char (ref index, out c)) {
        if (c.isalpha ()) {
            stdout.printf ("%s", c.toupper ().to_string ());
        } else {
            stdout.printf ("_");
        }
    }
    stdout.printf ("\n");
}
