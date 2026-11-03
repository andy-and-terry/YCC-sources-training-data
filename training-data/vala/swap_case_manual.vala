string swap_case (string s) {
    var sb = new StringBuilder ();
    for (int i = 0; i < s.length; i++) {
        unichar c = s.get_char (s.index_of_nth_char (i));
        sb.append_unichar (c.isupper () ? c.tolower () : c.toupper ());
    }
    return sb.str;
}

void main () {
    print ("%s\n", swap_case ("Hello World 42"));
}
